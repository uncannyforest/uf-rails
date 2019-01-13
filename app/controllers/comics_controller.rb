class ComicsController < ApplicationController
  def show
    @id = params[:id]
  end
end
