class ComicsController < ApplicationController
  def show
    @id = params[:id]
    @panels = PanelList.new @id
  end

end
