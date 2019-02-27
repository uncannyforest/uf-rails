class ComicsController < ApplicationController
  def show
    @id = params[:id].to_i
    @panels = Panel.list @id, UF_RECORD.comics[@id][:layout]
    @exists_prev = @id > 0
    @link_first = "/0"
    @link_prev = "/#{@id-1}"
    @exists_next = @id < UF_RECORD.num_comics - 1
    @link_next = "/#{@id+1}"
    @link_last = "/#{UF_RECORD.num_comics - 1}"
  end

end
