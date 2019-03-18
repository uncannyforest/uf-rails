require 'panel'

class ComicsController < ApplicationController
  TITLE_PREFIX = "Uncanny Forest — "

  def show
    @section = :comics
    @id = params[:id].to_i
    @title = TITLE_PREFIX + UF_RECORD.comics_with_spoilers[@id][:title]
    @panels = Panel.list_from_assets @id, Panel::MOBILE_PATH
    @image = Panel::DESKTOP_PATH % {comic: @id}
    @exists_prev = @id > 0
    @link_first = "/0"
    @link_prev = "/#{@id-1}"
    @exists_next = @id < UF_RECORD.num_comics - 1
    @link_next = "/#{@id+1}"
    @link_last = "/#{UF_RECORD.num_comics - 1}"
    @analyze = true
    @commentary = true
  end

end
