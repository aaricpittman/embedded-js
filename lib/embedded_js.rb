# frozen_string_literal: true

require 'embedded_js/version'
require 'embedded_js/config'
require 'embedded_js/cli'

module EmbeddedJs
  def self.config
    @config ||= Config.load
  end

  def self.gem_specs
    @gem_specs ||= Bundler.load.specs
  end
end
