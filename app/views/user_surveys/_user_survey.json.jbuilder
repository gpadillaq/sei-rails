json.extract! user_survey, :id, :user_id, :user_type_id, :level_id, :group_id, :interval_id, :subject_id, :activa, :created_at, :updated_at
json.url user_survey_url(user_survey, format: :json)