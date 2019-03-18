require 'prefs'

class ApplicationController < ActionController::Base
  before_action :process_prefs

  def process_prefs
    @prefs = Prefs.new(cookies)

    request.query_parameters.each do |key, value|
      if @prefs.is_valid?(key, value)
        @prefs.set(key, value)
      end
    end
  end

end
