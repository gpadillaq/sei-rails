json.extract! survey_comment, :id, :user_survey_id, :descripcion, :created_at, :updated_at
json.url survey_comment_url(survey_comment, format: :json)