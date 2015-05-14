class Question < ActiveRecord::Base
  #validates_presence_of :question, :answer0, :answer1, :answer2, :answer3, :correctAnswer, :difficulty
	
	def self.get_random_question(diff)
		@questions = Question.select("id, question, answer0, answer1, answer2, answer3").where(difficulty: diff).all
		
		@question = @questions[rand(@questions.length) - 1]
	end
end
