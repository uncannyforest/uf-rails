require 'yaml'

class UfRecord

  @@time_zone = "Mountain Time (US & Canada)"

  attr_reader :num_comics

  def initialize
    @data = (YAML.load(File.read(config = File.join(Rails.root, 'config', 'uncannyforest.yaml'))))
    @data.deep_symbolize_keys!
    init_num_comics
  end

  def comics
    @data[:comics]
  end

  def init_num_comics
    max_comic = @data[:comics].length - 1
    while spoilers max_comic
      max_comic = max_comic - 1
    end
    @num_comics = max_comic + 1
  end

  def spoilers comic
    comic_date = @data[:comics][comic][:date]
    if comic_date.nil?
      return false
    end
    today = Time.now.in_time_zone(@@time_zone).to_date
    comic_date > today
  end

end
