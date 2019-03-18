require 'redcarpet'

class WelcomeMatController < ApplicationController
  def show
    mat_message_path = File.join(Rails.root, 'purpose.md')
    if File.exist? mat_message_path then
      @mat_message = File.read(mat_message_path)
    end
    @mat_message << "\n\n\#\#[Go to root page](/welcome_home)\n"\

    render :layout => 'plain'
  end
end
