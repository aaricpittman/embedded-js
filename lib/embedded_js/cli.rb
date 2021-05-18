# frozen_string_literal: true

require 'thor'

require_relative 'commands/init'
require_relative 'commands/preinstall'

module EmbeddedJs
  class Cli < Thor
    desc 'init', 'Generates EmbeddedJs configuration.'
    option :package_manager,
           desc: 'Specify the JavaScript package manager to configure. (yarn, npm)',
           type: :string,
           default: 'npm'
    def init
      Commands::Init.call(package_manager: options[:package_manager])
    end

    desc 'preisntall', 'Installs configured js packages embedded in gems.'
    def preinstall
      Commands::Preinstall.call(gems: EmbeddedJs.config.gems)
    end
  end
end
