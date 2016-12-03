class Survey < ApplicationRecord
  has_many :user_surveys

  PLATILLAS = {
    1 => 'alumnos',
    2 => 'docentes',
    3 => 'directivos'
  }

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
        (2..file.last_row).each do |row|
          user_survey_record = file.row(row)
          atributos = {
            user_id: User.find_by_codigo(user_survey_record.first.to_s).try(:id),
            user_type_id: UserType.find_by_id(user_survey_record.second).try(:id),
            level_id: Level.find_by_id(user_survey_record.third).try(:id),
            group_id: Group.find_by_id(user_survey_record.fourth).try(:id),
            interval_id: Interval.find_by_id(user_survey_record.fifth).try(:id),
            subject_id: Subject.find_by_codigo(user_survey_record[5]).try(:id),
            docente_id: User.find_by_codigo(user_survey_record[6]).try(:id),
            survey_id: self.id
          }
          @user_survey = UserSurvey.new(atributos)
          logger.info '************************************************************************************************'
          logger.info "* Registrando User: #{user_survey_record[1]}"
          logger.info "*   Survey: #{self.id}"
          begin
            @user_survey.save!
          rescue => ex
            logger.error '************************************************************************************************'
            logger.error ex.message
            logger.error ex.backtrace.join("\n")
            logger.error '************************************************************************************************'
            @errors.push([@user_survey.try(:user).try(:display_name), @user_survey.try(:subject).try(:codigo)].join("-"))
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

  def activar(state)
    users_list = Array.new
    self.user_surveys.each do |user_survey|
      users_list.push(user_survey.user)
    end
    users_list.uniq.each do |user|
      UserMailer.password_email(user).deliver_now
    end
    self.update(active: true)
  end

  def self.user_surveys_active(current_user)
    survey = Survey.where(active: true).where('inicio <= ? and fin >= ?', Date.today, Date.today).first
    user_survey_available = survey.user_surveys.where(user_id: current_user.id)
    user_type = user_survey_available.first.user_type
    plantilla = PLATILLAS[user_type.id]
    questions = Question.where(user_type_id: user_type.id)
    answers = Answer.where(user_type_id: user_type.id)

    [survey, user_survey_available, plantilla, questions, answers]
  end

  def self.save_survey_results(survey_results, survey_comments, user)
    begin
      self.transaction do
        survey_results.each do |survey_result|
          begin
            SurveyResult.create(survey_result.last)
          rescue => e
            raise e
          end
        end
        survey_comments.each do |survey_comment|
          begin
            SurveyComment.create(survey_comment.last)
          rescue => e
            raise e
          end
        end
        UserSurvey.where(user_id: user.id).update_all(activa: false)
        user.save!
      end
    rescue => e
      logger.error '*****************************************************'
      logger.error e.message
      logger.error e.backtrace.join("\n")
      logger.error '*****************************************************'
      raise
    end
  end

  def self.docente_survey(survey_results, user)
    begin
      docente_surveys = Array.new
      self.transaction do
        survey_results.each do |survey_result|
          begin
            survey_result = survey_result.last
            user_survey = UserSurvey.find_by_id(survey_result[:user_survey_id])
            interval = user_survey.try(:interval).try(:display_name)
            level = user_survey.try(:level).try(:display_name)

            docente_surveys.push({
              page_1: {
                nombre: {value: user.try(:display_name)},
                ciclo_and_year: {value: [interval, level].join('-')},
                (['dimension1', "nivel#{survey_result[:dimension1]}"].join('_')).to_sym => {value: 'X'},
                (['dimension2', "nivel#{survey_result[:dimension2]}"].join('_')).to_sym => {value: 'X'}
              },
              page_2: {
                (['dimension3', "nivel#{survey_result[:dimension3]}"].join('_')).to_sym => {value: 'X'},
                (['dimension4', "nivel#{survey_result[:dimension4]}"].join('_')).to_sym => {value: 'X'},
                (['dimension5', "nivel#{survey_result[:dimension5]}"].join('_')).to_sym => {value: 'X'},
                comentarios: {value: survey_result[:comentarios]}
              }
            })
          rescue => e
            raise e
          end
        end
        UserSurvey.where(user_id: user.id).update_all(activa: false)
        user.save!
      end
    rescue => e
      logger.error '*****************************************************'
      logger.error e.message
      logger.error e.backtrace.join("\n")
      logger.error '*****************************************************'
      raise
    end
    docente_surveys
  end
end
