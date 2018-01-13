require 'yaml'
require_relative 'logger_wrapper'
require 'psych'

module ParseData

  def self.parsed_yaml_file_data(file_path)
    #p file_path
    YAML.load(File.open(file_path))
  rescue ArgumentError => e
    LoggerWrapper.logger.info "Could not parse YAML: #{e.message}"
  end



end