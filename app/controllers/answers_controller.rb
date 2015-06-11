class AnswersController < ApplicationController

  def create
    @answer = Answer.new(params[:answer].symbolize_keys)

    if @answer.save
      @answer.correct? ? flash[:notice] = "Bonne réponse" : flash[:alert] = "Mauvaise réponse"
    else
      flash[:alert] = "Mauvaise réponse"
    end
    redirect_to random_question_path(@answer.question.level.name)
  end

  def random_question
    @level = Level.find_by_name(params[:name])
    @question = @level.questions.limit(1).order("RAND()").first #Pick a random question 
    @answer = Answer.new({question_id: @question.id})

    respond_to do |format|
      format.html
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :correct, :question_id)
  end

end