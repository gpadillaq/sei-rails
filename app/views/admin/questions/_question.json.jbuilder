json.extract! question, :id, :user_type_id, :descripcion, :question_type_id, :created_at, :updated_at
json.url question_url(question, format: :json)