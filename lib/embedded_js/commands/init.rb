# frozen_string_literal: true

require 'erb'

module EmbeddedJs
  module Commands
    class Init
      TEMPLATES_DIR = File.expand_path('../../templates', __dir__)
      CONFIG_OUTPUT_PATH = './.embeddedjs'

      class << self
        def call(package_manager: 'npm')
          new.call(package_manager: package_manager)
        end
      end

      def call(package_manager: 'npm')
        @package_manager = package_manager

        generate_config_file
        instructions
      end

      private

      attr_reader :package_manager

      def generate_config_file
        File.write(CONFIG_OUTPUT_PATH, render_config)
      end

      def instructions
        post_install_msg = File.read("#{TEMPLATES_DIR}/post_install.txt")

        puts post_install_msg
      end

      def config_template
        File.read(config_template_path)
      end

      def config_template_path
        "#{TEMPLATES_DIR}/.embeddedjs.erb"
      end

      def render_config
        ERB.new(config_template).result(binding)
      end
    end
  end
end
