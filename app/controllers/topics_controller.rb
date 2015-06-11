class TopicsController < ApplicationController

  def index
    @topics = Topic.all

    respond_to do |format|
      format.html
    end
  end


end