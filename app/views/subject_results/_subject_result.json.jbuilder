json.extract! subject_result, :id, :user_survey_id, :question_id, :answer_id, :created_at, :updated_at
json.url subject_result_url(subject_result, format: :json)