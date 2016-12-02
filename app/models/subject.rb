class Subject < ApplicationRecord

  validates :codigo, presence: true, uniqueness: true
  validates :nombre, presence: true

  def display_name
    self.nombre
  end

  def self.import(file)
    @errors = Array.new
    begin
      self.transaction do
        file = User.open_spreadsheet(file)
        logger.info '************************************************************************************************'
        logger.info "* Se Inició Importación Masiva con Fecha: #{Date.today}"
        (2..file.last_row).each do |row|
          @subject = Subject.new
          subject_record = file.row(row)
          @subject.attributes = {
            codigo: subject_record.first.to_s,
            nombre: subject_record.second,
          }

          logger.info '************************************************************************************************'
          logger.info "* Registrando Subject: #{subject_record[1]}"
          logger.info "*   Código: #{subject_record[0]}"
          begin
            @subject.save!
          rescue => ex
            logger.error '************************************************************************************************'
            logger.error ex.message
            logger.error ex.backtrace.join("\n")
            logger.error '************************************************************************************************'
            @errors.push([@subject.display_name, @subject.codigo].join("-"))
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
