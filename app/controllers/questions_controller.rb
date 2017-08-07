class QuestionsController < ApplicationController

  before_action except: [:index, :show] do 
  if @current_user.blank?
    redirect_to login_path
  end
end

  def index
    if params[:search].present?
      @questions = Question.search_title_and_body(params[:search]).page params[:page]
    else
      @questions = Question.all.order(created_at: :desc).page params[:page]
    end
    @question = Question.new
  end

  def new
    @question =  Question.new
  end

  def create
    @question = Question.new
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.user_id = @current_user.id
    if @question.save
      redirect_to root_path

    else
      render :new
    end
  end

  def show
    @question = Question.find_by id: params[:id]
  end

  def edit
    @question = Question.find_by id: params[:id]
  end

  def update
    @question = Question.find_by id: params[:id]
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    if @question.save
      redirect_to question_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find_by id: params[:id]
    @question.destroy
    redirect_to root_path
  end

end
