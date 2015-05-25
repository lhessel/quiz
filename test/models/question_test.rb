require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  
	test "gets random question" do
		@question = Question.get_random_question(1)
		assert @question.valid?
	end
	
end
