class Api::AnswersController < Api::ApiController

  before_action :authenticate_user!, only: [:update, :create, :destroy]

  def create
    @question = Question.find_by id: params[:question_id]
    @answer = Answer.new
    @answer.body = params[:answer][:body]
    @answer.question_id = params[:question_id]
    @answer.user_id = @current_user.id
    if @answer.save
      head :created
    else
      render json: {errors: @answer.errors}, status: 422
    end
  end

  def update
    @question = Question.find_by id: params[:question_id]
    @answer = Answer.find(params[:id])
    if @question.user_id == @current_user.id
      @answer.correct = true
      @answer.save
      head :ok
    else
      render json: {status: "unauthorized", message: "You are not authorized to perform that action"}, status: 401
    end
  end

  def destroy
    @question = Question.find_by id: params[:question_id]
    @answer = Answer.find(params[:id])
    if @answer.user_id == @current_user.id
      @answer.destroy
      head :ok
    else
      render json: {status: "unauthorized", message: "You are not authorized to perform that action"}, status: 401
    end
  end

end
