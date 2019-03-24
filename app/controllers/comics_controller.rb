require 'panel'

class ComicsController < ApplicationController
  TITLE_PREFIX = "Uncanny Forest — "

  def show
    @id = params[:id].to_i
    @title = TITLE_PREFIX + UF_RECORD.comics[@id][:title]
    @panels = Panel.list @id, UF_RECORD.comics[@id][:layout]
    @exists_prev = @id > 0
    @link_first = "/0"
    @link_prev = "/#{@id-1}"
    @exists_next = @id < UF_RECORD.num_comics - 1
    @link_next = "/#{@id+1}"
    @link_last = "/#{UF_RECORD.num_comics - 1}"
    @analyze = true
  end

end
