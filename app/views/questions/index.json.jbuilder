json.array!(@questions) do |question|
  json.extract! question, :id, :question, :answer0, :answer1, :answer2, :answer3, :correctAnswer, :difficulty, :contributedBy
  json.url question_url(question, format: :json)
end
