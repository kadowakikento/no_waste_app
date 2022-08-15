json.extract! food, :id, :name, :due_time, :user_id, :created_at, :updated_at
json.url food_url(food, format: :json)
