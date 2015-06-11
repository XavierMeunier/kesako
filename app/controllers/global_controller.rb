class GlobalController < ApplicationController

  def home
    @levels = Level.all.order(:difficulty)

    respond_to do |format|
      format.html
      format.json { render json: @levels }
    end
  end

end