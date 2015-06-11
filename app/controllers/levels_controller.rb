class LevelsController < ApplicationController

  def index
    @levels = Level.all.order(:difficulty)

    respond_to do |format|
      format.html
      format.json { render json: @levels }
    end
  end

  def random_question
    @level = Level.find_by_name(params[:name])
    @question = @level.questions.limit(1).order("RAND()").first
    @answer = Answer.new({question_id: @question.id})

    respond_to do |format|
      format.html
      format.json
    end
  end

end