require 'record'

class SparseController < ApplicationController
  def email
    @about = Record.load('about')
    render :layout => 'sparse'
  end
end
