class AnswersController < ApplicationController
before_action :set_question

def index
  @answers = @question.answers
  render json: @answers
end
  def create 
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user
    if @answer.save 
      render json: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end
def show
  @answer = @question.answers.find(params[:id])
  render json: @answer
end
  
def select_answer 
  @answer = @question.answers.find(params[:id])
  if @question.user == @answer.user or current_user.moderator?
    render json: "You cannot your select answer because this your question"
  else
    if current_user == @question.user    
      @answer.update_attribute(:selected, true)
      @answer.question(:completed, true)
      if @answer.save
         
        render json: @answer
      else
        render json: @answer.errors, status: :unprocessable_entity         
      end
    else
      render json: "You are not user of this question"
    end 
  end
  
end




private
def set_question
  @question = Question.find(params[:question_id])
end


def answer_params
  params.require(:answer).permit(:atext,:user_id)
  
end



end
