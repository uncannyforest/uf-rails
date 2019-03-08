require 'record'

class AboutController < ApplicationController
  def show
    @about = Record.load('about')
  end
end
