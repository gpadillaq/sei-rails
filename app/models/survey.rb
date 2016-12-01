class Survey < ApplicationRecord
  has_many :user_surveys

  def display_name
    [self.inicio, self.fin].join(' a ')
  end

  def import(file)
    @errors = Array.new
    begin
      self.transaction do
        file = User.open_spreadsheet(file)
        logger.info '************************************************************************************************'
        logger.info "* Se Inició Importación Masiva con Fecha: #{Date.today}"
        @survey = self
        (2..file.last_row).each do |row|

          user_survey_record = file.row(row)
          atributos = {
            user_id: User.find_by_codigo(user_survey_record.first.to_s).try(:id),
            user_type_id: UserType.find_by_id(user_survey_record.second).try(:id),
            level_id: Level.find_by_id(user_survey_record.third).try(:id),
            group_id: Group.find_by_id(user_survey_record.fourth).try(:id),
            interval_id: Interval.find_by_id(user_survey_record.fifth).try(:id),
            subject_id: Subject.find_by_codigo(user_survey_record.last).try(:id)
          }
          byebug
          @survey.user_surveys.build(atributos)
          logger.info '************************************************************************************************'
          logger.info "* Registrando User: #{user_survey_record[1]}"
          logger.info "*   Survey: #{self.id}"
        end
        begin
          byebug
          @survey.save!
        rescue => ex
          byebug
          logger.error '************************************************************************************************'
          # logger.error ex.message
          logger.error ex.backtrace.join("\n")
          logger.error '************************************************************************************************'
          # @errors.push([@survey.display_name, @user.codigo].join("-"))
        end
        if @errors.present?
          raise ArgumentError, @errors
        end
      end
    rescue => ex
      logger.error '************************************************************************************************'
      # logger.error ex.message
      logger.error ex.backtrace.join("\n")
      logger.error '************************************************************************************************'
      raise ArgumentError, @errors.join("<br>")
    end
  end
end
