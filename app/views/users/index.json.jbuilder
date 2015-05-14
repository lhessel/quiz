json.array!(@users) do |user|
  json.extract! user, :id, :username, :password, :contributedQuestions
  json.url user_url(user, format: :json)
end
