# frozen_string_literal: true

require_relative '../adaptors/command_runner'
require_relative '../gem_package'
require_relative '../package_managers/factory'

module EmbeddedJs
  module Commands
    class Preinstall
      ENV_VARIABLE_NAME = 'EP_PREINSTALL'

      class << self
        def call(gems:)
          new.call(gems: gems)
        end
      end

      def initialize(
        command_runner: Adaptors::CommandRunner.new,
        package_manager: PackageManagers::Factory.build(EmbeddedJs.config.package_manager)
      )
        @command_runner = command_runner
        @package_manager = package_manager
      end

      def call(gems:)
        return if ENV.fetch(ENV_VARIABLE_NAME, nil)

        gems.each(&method(:install_embedded_package))
      end

      private

      attr_reader :command_runner, :package_manager

      def install_embedded_package(gem)
        embedded_jsage = GemPackage.new(gem)

        embedded_jsage.with_path do |path|
          command_runner.run(
            package_manager.install_command(path),
            { ENV_VARIABLE_NAME => '1' }
          )
        end
      end
    end
  end
end
