require 'record'
require 'panel'

class RssController < ApplicationController
  def show
    render :layout => 'plain'
  end
end
