class AnswersController < ApplicationController

  def create
    @question = Question.find_by id: params[:question_id]
    @answer = Answer.new
    @answer.body = params[:answer][:body]
    @answer.question_id = params[:question_id]
    @answer.user_id = @current_user.id
    if @answer.save
      redirect_to question_path(@question)
    end
  end
end
