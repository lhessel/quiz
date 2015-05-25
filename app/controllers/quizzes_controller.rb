class QuizzesController < ApplicationController
	before_filter :login_required
	before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  # GET /quizzes
  # GET /quizzes.json
  def index
    @quizzes = Quiz.order('finalDifficulty DESC, timestamp DESC').all
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end
	
	def win
		respond_to do |format|
			format.html
			format.js { render 'win', :content_type=>'text/html', :layout=>false }
		end
	end
	
	def quiz
		@difficulty = params[:difficulty]
		@teammate = params[:teammate]
		
		if @difficulty.to_i > 1
			@prev_question = Question.find(params[:question])
			if @prev_question.correctAnswer != params[:answer].to_i
				saveQuiz
				respond_to do |format|
					format.html { render 'wrong' }
					format.js { render 'wrong', :content_type=>'text/html', :layout=>false }
				end
				return
			end
		end
		
		if @difficulty.to_i > 3
			saveQuiz
			redirect_to action: "win"
			return
		end
		
		@question = Question.get_random_question(@difficulty)
		
		respond_to do |format|
			format.html
			format.js { render '_quiz', :content_type=>'text/html', :layout=>false }
		end
	end
	
	def saveQuiz
		@quiz = Quiz.create(:finalDifficulty => @difficulty.to_i-1, :timestamp => Time.now)
		@quiz.users << current_user
		if(@teammate != "" && @teammate != nil)
			@quiz.users << User.find(@teammate.to_i)
		end
		@quiz.save
	end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:quiz).permit(:finalDifficulty, :timestamp, user_ids:[])
    end
end
