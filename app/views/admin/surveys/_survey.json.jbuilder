json.extract! survey, :id, :nombre, :inicio, :fin, :created_at, :updated_at
json.url survey_url(survey, format: :json)