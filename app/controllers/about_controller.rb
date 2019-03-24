require 'record'

class AboutController < ApplicationController
  def show
    @section = :about
    @about = Record.load('about')
  end
end
