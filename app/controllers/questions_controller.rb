class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    @question = Question.new
  end

  def new
    @question =  Question.new
  end

  def create
    @question = Question.new
    @question.title = params[:question][:title]
    @question.body = params[:question][:title]
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
