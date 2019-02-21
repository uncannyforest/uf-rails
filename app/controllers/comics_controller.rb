class ComicsController < ApplicationController
  def show
    @id = params[:id].to_i
    @panels = Panel.list @id, UF_RECORD.comics[@id][:layout]
    @exists_prev = @id > 0
    @link_first = "/c/0"
    @link_prev = "/c/#{@id-1}"
    @exists_next = @id < UF_RECORD.numComics - 1
    @link_next = "/c/#{@id+1}"
  end

end
