json.extract! survey_result, :id, :user_survey_id, :question_id, :answer_id, :created_at, :updated_at
json.url survey_result_url(survey_result, format: :json)
