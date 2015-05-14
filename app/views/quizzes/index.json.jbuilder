json.array!(@quizzes) do |quiz|
  json.extract! quiz, :id, :user, :finalDifficulty, :timestamp
  json.url quiz_url(quiz, format: :json)
end
