json.extract! user, :id, :codigo, :nombre, :created_at, :updated_at
json.url user_url(user, format: :json)