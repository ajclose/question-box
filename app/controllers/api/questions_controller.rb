class Api::QuestionsController < Api::ApiController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
  @question = Question.new question_params
  if @question.save
    head :created
  else
    render json: {errors: @question.errors}, status: 422
  end
end

end
