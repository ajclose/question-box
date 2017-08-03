class AnswersController < ApplicationController

  def show

  end

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

  def edit

  end

  def update
    @question = Question.find_by id: params[:question_id]
    @answer = Answer.find(params[:id])
    @answer.correct = true
    @answer.save
    redirect_to question_path(@question)
  end

  def destroy
    @question = Question.find_by id: params[:question_id]
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question)
  end
end
