# frozen_string_literal: true

require 'open3'

module EmbeddedJs
  module Adaptors
    class CommandRunner
      def initialize(io: Open3)
        @io = io
      end

      def run(cmd, environment_variables = {})
        io.popen3(
          environment_variables,
          "#{cmd} 2>&1"
        ) do |stdin, stdout, _stderr, wait_thread|
          stdin.close_write

          while line = stdout.gets
            puts line
          end

          puts wait_thread.value
        end
      end

      private

      attr_reader :io
    end
  end
end
