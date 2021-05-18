# frozen_string_literal: true

module EmbeddedJs
  module PackageManagers
    class Npm
      INSTALL_COMMAND = 'npm install %<engine_path>s'

      def install_command(engine_path)
        format(INSTALL_COMMAND, engine_path: engine_path)
      end
    end
  end
end
