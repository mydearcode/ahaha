class AnswersController < ApplicationController
before_action :set_question

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

  def answer_params
    params.require(:answer).permit(:atext,:user_id)
    
  end
private
def set_question
  @question = Question.find(params[:question_id])
end

end
