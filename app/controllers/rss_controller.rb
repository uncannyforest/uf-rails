require 'record'
require 'panel'

class RssController < ApplicationController
  def show
    render :layout => 'plain'
  end

  def mobile
    render :layout => 'plain'
  end
end
