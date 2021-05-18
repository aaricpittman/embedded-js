# frozen_string_literal: true

require 'fileutils'
require 'tmpdir'

module EmbeddedJs
  module Adaptors
    class IO
      def copy_files(files:, to:)
        FileUtils.cp_r(
          files,
          to,
          preserve: true
        )
      end

      def exists?(path:)
        File.exist?(path)
      end

      def mkdir(path:)
        FileUtils.mkdir_p(path)
      end

      def tmpdir
        Dir.tmpdir
      end
    end
  end
end
