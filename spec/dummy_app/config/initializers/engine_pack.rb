require 'embedded_js'

EmbeddedJs.configure do |config|
  config.package_manager = :yarn
  config.engines = %w[dummy_engine]
end
