json.extract! employee, :id, :name, :age, :email, :password, :gender, :reset_token, :reset_link, :created_at, :updated_at
json.url employee_url(employee, format: :json)
