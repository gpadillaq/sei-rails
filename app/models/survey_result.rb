class SurveyResult < ApplicationRecord
  belongs_to :user_survey
  belongs_to :question
  belongs_to :answer

  def value
    self.answer.answer_type.scala
  end

  def self.quantitative_result
    survey_results = self.all.map do |survey_result|
      [
        survey_result.user_survey.user_type_id,
        survey_result.user_survey.docente_id,
        survey_result.user_survey.group_id,
        survey_result.user_survey.level_id,
        survey_result.user_survey.interval_id,
        survey_result.user_survey.subject_id
      ]
    end.uniq

    quantitative_results = Array.new

    survey_results.each do |survey_result|
      value_results = SurveyResult.joins(:user_survey).where(
        user_surveys: {user_type_id: survey_result[0]},
        user_surveys: {docente_id: survey_result[1]},
        user_surveys: {group_id: survey_result[2]},
        user_surveys: {level_id: survey_result[3]},
        user_surveys: {interval_id: survey_result[4]},
        user_surveys: {subject_id: survey_result[5]}
      ).map { |s| s.value }

      quantitative_results.push({
        user_type: UserType.find_by_id(survey_result[0]).try(:display_name),
        docente: User.find_by_id(survey_result[1]).try(:display_name),
        group: Group.find_by_id(survey_result[2]).try(:display_name),
        level: Level.find_by_id(survey_result[3]).try(:display_name),
        interval: Interval.find_by_id(survey_result[4]).try(:display_name),
        subject: Subject.find_by_id(survey_result[5]).try(:display_name),
        value: value_results.sum,
        cantidad: value_results.count
      })
    end
    quantitative_results
  end
end
