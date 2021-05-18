# frozen_string_literal: true

RSpec.describe EmbeddedJs::Config do
  describe '.load' do
    let(:config_path) { 'spec/support/fixtures/example-config' }

    it 'should return instance of config' do
      config = EmbeddedJs::Config.load(config_path: config_path)

      expect(config.package_manager).to eq(:yarn)
      expect(config.gems).to eq(%w[gem1 gem2 gem3])
    end
  end
end
