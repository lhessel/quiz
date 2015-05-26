require 'test_helper'

class QuizzesControllerTest < ActionController::TestCase
  setup do
    @quiz = quizzes(:one)
		@prev_question = questions(:one)
		@question = questions(:two)
		@user = users(:one)
		@teammate = users(:two)
		log_in_as(@user)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quizzes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quiz" do
    assert_difference('Quiz.count') do
      post :create, quiz: { finalDifficulty: @quiz.finalDifficulty, timestamp: @quiz.timestamp }
    end

    assert_redirected_to quiz_path(assigns(:quiz))
  end

  test "should show quiz" do
    get :show, id: @quiz
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quiz
    assert_response :success
  end

  test "should update quiz" do
    patch :update, id: @quiz, quiz: { finalDifficulty: @quiz.finalDifficulty, timestamp: @quiz.timestamp }
    assert_redirected_to quiz_path(assigns(:quiz))
  end

  test "should destroy quiz" do
    assert_difference('Quiz.count', -1) do
      delete :destroy, id: @quiz
    end

    assert_redirected_to quizzes_path
  end
	
	test "should show win" do
		get :win
		assert_response :success
	end
	
	test "should start quiz" do
		get :quiz, difficulty: 1
		assert_response :success
	end
	
	test "should win quiz" do
    assert_difference('Quiz.count') do
			get :quiz, { :difficulty => 4, :question => @question.id, :answer => @question.correctAnswer}
			assert_redirected_to(controller: "quizzes", action: "win")
		end
	end
	
	test "should win quiz with teammate" do
    assert_difference('Quiz.count') do
			get :quiz, { :difficulty => 4, :question => @question.id, :answer => @question.correctAnswer, :teammate => @teammate}
			assert_redirected_to(controller: "quizzes", action: "win")
		end
	end
	
	test "should lose quiz" do
    assert_difference('Quiz.count') do
			get :quiz, { :difficulty => 2, :question => @question.id, :answer => 3}
			assert_response :success
			assert_select '#wrong_answer'
		end
	end
end
