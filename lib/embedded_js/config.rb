# frozen_string_literal: true

require 'json'

module EmbeddedJs
  class Config
    DEFAULT_CONFIG_PATH = './.embeddedjs'

    class << self
      def load(config_path: DEFAULT_CONFIG_PATH)
        new(**JSON.parse(File.read(config_path), symbolize_names: true))
      end
    end

    attr_accessor :package_manager, :gems

    def initialize(package_manager: :npm, gems: [])
      @gems = gems
      @package_manager = package_manager.to_sym
    end
  end
end
