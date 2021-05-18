# frozen_string_literal: true

RSpec.describe EmbeddedJs::PackageManagers::Factory do
  describe '.build' do
    it 'should return PackageManagers::Npm if name is :npm' do
      expect(described_class.build(:npm)).to be_a(EmbeddedJs::PackageManagers::Npm)
    end

    it 'should return PackageManagers::Yarn if name is :yarn' do
      expect(described_class.build(:yarn)).to be_a(EmbeddedJs::PackageManagers::Yarn)
    end
  end
end
