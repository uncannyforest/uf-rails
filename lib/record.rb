require 'yaml'

class Record

   def self.load record_name
    record = (YAML.load(File.read(config = File.join(Rails.root, 'app', 'assets', 'text', "#{record_name}.yaml"))))
    record.deep_symbolize_keys
  end

end
