# config/initializers/rack_builder_override.rb

module Rack
    class Builder
      def self.parse_file_with_options(config_file)
        rack_app = parse_file_without_options(config_file)
        rack_options ||= {}
        [rack_app, rack_options]
      end
  
      class << self
        alias_method :parse_file_without_options, :parse_file
        alias_method :parse_file, :parse_file_with_options
      end
    end
end
  