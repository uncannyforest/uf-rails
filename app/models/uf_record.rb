require 'yaml'

class UfRecord

  def initialize
    @data = (YAML.load(File.read(config = File.join(Rails.root, 'config', 'uncannyforest.yaml'))))
    @data.deep_symbolize_keys!
  end

  def test
    p @data
  end

  def numComics
    @data[:comics].length
  end

end
