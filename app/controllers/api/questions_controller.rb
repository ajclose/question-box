class Api::QuestionsController < Api::ApiController

  before_action :authenticate_user!, only: [:update, :create, :destroy]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.user_id = @current_user.id
    if @question.save
      head :created
    else
      render json: {errors: @question.errors}, status: 422
    end
  end

  def update
    @question = Question.find_by id: params[:id]
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.user_id = @current_user.id
    if @question.save
      head :ok
    else
      render json: {errors: @question.errors}, status: 422
    end
  end

  def destroy
    @question = Question.find_by id: params[:id]
    @question.destroy
    head :ok
  end

end
