class QuestionsController < ApplicationController
  before_action :authenticate_user!#, except:[:show, :index]
  before_action :set_question, only: [:show, :update, :destroy, :create_answer]

  # GET /questions
  def index
    @questions = Question.all

    render json: @questions
  end

  # GET /questions/1
  def show
    @answers = @question.answers
    render json: @question, include:[answers: {except: :question_id}]
   
  end

  # POST /questions
  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      render json: @question, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      render json: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
  end

  def completed_questions
    @questions = Question.where(completed: true)
    render json: @questions
  end

def check_answer
  if current_user.moderator? or current_user.admin?
    @answer = @question.answers.find(params[:id])
    @answer.update_attribute(rewardable: true)
    if @answer.save
      render json: @question.answers      
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  else
    render json: "You don't have permission for checking that question"
  end
end

def finish_question
  if current_user.moderator? or current_user.admin?
    @question.update_attribute(finished: true)
    @rewardable_answers = @question.answers.where(rewardable: true)
    reward = (@question.award*70/100) / @rewardable_answers.size
    @rewardable_answers.each do |answer|
      answer.user.update_attribute(budget: answer.user.budget + reward )
    end
    
  end
end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:title, :description, :category_id, :award)
    end

    
end
