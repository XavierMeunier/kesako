class LevelsController < ApplicationController

  def index
    @levels = Level.all.order(:difficulty)
    @questions = (@levels.map{|l| l.questions.count} != 0)

    respond_to do |format|
      format.html
    end
  end

  def random_question
    @level = Level.find_by_name(params[:name])
    @question = @level.questions.limit(1).order("RAND()").first
    @answer = Answer.new({question_id: @question.id})
    @sub_topics = @question.sub_topics

    respond_to do |format|
      format.html
    end
  end

end