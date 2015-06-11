class GlobalController < ApplicationController

  def home
    @levels = Level.all.order(:difficulty)

    respond_to do |format|
      format.html
    end
  end

end