class QuestionsController < ApplicationController
  helper :application

  def index
    @questions = Question.all.order(:created_at)

    respond_to do |format|
      format.html
      format.json { render json: @questions }
    end
  end

  def new
    @question = Question.new()
    @levels = Level.all.order("difficulty")

    respond_to do |format|
      format.html
    end
  end

  def create
    @question = Question.new(params[:question].symbolize_keys)
    if @question.save
      redirect_to questions_url, notice: 'La question a été crée'
    else
      @levels = Level.all.order("difficulty")
      flash[:alert] = @question.errors.full_messages
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    @levels = Level.all.order("difficulty")

    respond_to do |format|
      format.html
    end
  end

  def update
    @question = Question.find(params[:id])
    if(@question.update(question_params))
      redirect_to questions_url, notice: 'La question a été mise à jour'
    else
      @levels = Level.all.order("difficulty")
      flash[:alert] = @question.errors.full_messages
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_url, notice: 'La question a été supprimée'
  end


  private

  def question_params
    params.require(:question).permit(:content, :level_id, :answers_attributes => [:id, :content, :correct, :question_id, :_destroy])
  end

end