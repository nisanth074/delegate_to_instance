require 'spec_helper'
require 'delegate_to_instance'

describe DelegateToInstance do
  describe '.yay' do
    it 'says yay' do
      expect(DelegateToInstance.yay).to eq('Yay, RSpec works!')
    end
  end
end
