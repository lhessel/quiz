require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @question = questions(:one)
		@user = users(:one)
		log_in_as(@user)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post :create, question: { answer0: @question.answer0, answer1: @question.answer1, answer2: @question.answer2, answer3: @question.answer3, contributedBy: @question.contributedBy, correctAnswer: @question.correctAnswer, difficulty: @question.difficulty }
    end

    assert_redirected_to question_path(assigns(:question))
  end

  test "should show question" do
    get :show, id: @question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question
    assert_response :success
  end

  test "should update question" do
    patch :update, id: @question, question: { answer0: @question.answer0, answer1: @question.answer1, answer2: @question.answer2, answer3: @question.answer3, contributedBy: @question.contributedBy, correctAnswer: @question.correctAnswer, difficulty: @question.difficulty, question: @question.question }
    assert_redirected_to question_path(assigns(:question))
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question
    end

    assert_redirected_to questions_path
  end
end
