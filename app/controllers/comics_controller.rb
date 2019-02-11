class ComicsController < ApplicationController
  @@json_url = "https://drive.google.com/uc?authuser=0&id=1bcSqSZFwnBmnDXHbiUU3IkbHk99ZlVbT&export=download"

  def show
    @id = params[:id]
  end
end
