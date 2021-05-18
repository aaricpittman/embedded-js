# frozen_string_literal: true

require_relative 'npm'
require_relative 'yarn'

module EmbeddedJs
  module PackageManagers
    class Factory
      class << self
        def build(name)
          case name
          when :npm then PackageManagers::Npm.new
          when :yarn then PackageManagers::Yarn.new
          end
        end
      end
    end
  end
end
