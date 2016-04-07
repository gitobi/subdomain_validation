require 'rails_helper'

RSpec.describe Site, type: :model do
  describe 'validations' do
    subject { site }
    let(:site) { build :site, name: name }

    describe 'name' do

      context 'when name is 2 characters' do
        let(:name) { 'w' * 2 }
        it { is_expected.to_not be_valid }
      end
      context 'when name is 3 characters' do
        let(:name) { 'w' * 3 }
        it { is_expected.to be_valid }
      end
      context 'when name is 63 characters' do
        let(:name) { 'w' * 63 }
        it { is_expected.to be_valid }
      end
      context 'when name is 64 characters' do
        let(:name) { 'w' * 64 }
        it { is_expected.to_not be_valid }
      end

      context 'when name includes numbers' do
        let(:name) { '000' }
        it { is_expected.to be_valid }
      end
      context 'when name includes letters in upper case' do
        let(:name) { 'AAA' }
        it { is_expected.to be_valid }
      end
      context 'when name includes letters in lower case' do
        let(:name) { 'aaa' }
        it { is_expected.to be_valid }
      end
      context 'when name includes -' do
        let(:name) { 'a-a' }
        it { is_expected.to be_valid }
      end
      context 'when name includes $' do
        let(:name) { 'w$w' }
        it { is_expected.to_not be_valid }
      end
      context 'when name includes .' do
        let(:name) { 'w.w' }
        it { is_expected.to_not be_valid }
      end
      context 'when name includes ;' do
        let(:name) { 'w;w' }
        it { is_expected.to_not be_valid }
      end

      context 'when name starts with -' do
        let(:name) { '-ww' }
        it { is_expected.to_not be_valid }
      end
      context 'when name ends with -' do
        let(:name) { 'ww-' }
        it { is_expected.to_not be_valid }
      end
    end
  end
end
