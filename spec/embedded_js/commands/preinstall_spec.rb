# frozen_string_literal: true

RSpec.describe EmbeddedJs::Commands::Preinstall, type: :acceptance do
  let(:command_runner) { double('Open3') }
  let(:gem_specs) do
    [
      OpenStruct.new(name: 'package_a', full_gem_path: './spec/dummy_engine'),
      OpenStruct.new(name: 'package_b', full_gem_path: './spec/dummy_engine')
    ]
  end
  let(:subject) { EmbeddedJs::Commands::Preinstall.new(command_runner: command_runner) }
  let(:gems) do
    %w[
      package_a
      package_b
    ]
  end

  describe '#call' do
    before do
      mock_config = EmbeddedJs::Config.new(package_manager: :yarn)

      allow(EmbeddedJs).to receive(:config).and_return(mock_config)

      allow(EmbeddedJs).to receive(:gem_specs).and_return(gem_specs)
    end

    it 'should install each registered engine using the configured package manager' do
      expect(command_runner).to receive(:run).with(
        'yarn add file:/tmp/EmbeddedJs/package_a',
        { EmbeddedJs::Commands::Preinstall::ENV_VARIABLE_NAME => '1' }
      )
      expect(command_runner).to receive(:run).with(
        'yarn add file:/tmp/EmbeddedJs/package_b',
        { EmbeddedJs::Commands::Preinstall::ENV_VARIABLE_NAME => '1' }
      )

      subject.call(gems: gems)
    end
  end
end
