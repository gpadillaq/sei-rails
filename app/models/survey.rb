class Survey < ApplicationRecord
  has_many :user_surveys

  def display_name
    [self.inicio, self.fin].join(' a ')
  end

  def self.import(file)
    @errors = Array.new
    begin
      self.transaction do
        file = User.open_spreadsheet(file)
        logger.info '************************************************************************************************'
        logger.info "* Se Inició Importación Masiva con Fecha: #{Date.today}"
        (2..file.last_row).each do |row|
          @user = UserSurvey.new
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
end
