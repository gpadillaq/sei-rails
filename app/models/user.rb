class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :codigo, presence: true, uniqueness: true
  validates :nombre, presence: true
  validates :email, presence: true, uniqueness: true

  before_validation :random_password

  def display_name
    self.nombre
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.xls' then Roo::Excel.new(file.path, {packed: nil, file_warning: :ignore})
    when '.xlsx' then Roo::Excelx.new(file.path, {packed: nil, file_warning: :ignore})
    when '.ods' then Roo::OpenOffice.new(file.path, {packed: nil, file_warning: :ignore})
    else
      Rails.logger.error 'Verificar formato de archivo'
      return false
    end
  end

  def self.import(file)
    @errors = Array.new
    begin
      self.transaction do
        file = self.open_spreadsheet(file)
        logger.info '************************************************************************************************'
        logger.info "* Se Inició Importación Masiva con Fecha: #{Date.today}"
        (2..file.last_row).each do |row|
          @user = User.new
          user_record = file.row(row)
          @user.attributes = {
            codigo: user_record.first.to_s,
            nombre: user_record.second,
            email: user_record.last
          }

          logger.info '************************************************************************************************'
          logger.info "* Registrando User: #{user_record[1]}"
          logger.info "*   Código: #{user_record[0]}"
          begin
            @user.save!
          rescue => ex
            byebug
            logger.error '************************************************************************************************'
            logger.error ex.message
            logger.error ex.backtrace.join("\n")
            logger.error '************************************************************************************************'
            @errors.push([@user.display_name, @user.codigo].join("-"))
          end
        end
        if @errors.present?
          raise ArgumentError, @errors
        end
      end
    rescue => ex
      logger.error '************************************************************************************************'
      logger.error ex.message
      logger.error ex.backtrace.join("\n")
      logger.error '************************************************************************************************'
      raise ArgumentError, @errors.join("<br>")
    end
  end

  def random_password
    self.password = self.password_confirmation = SecureRandom.hex(8)
  end
end
