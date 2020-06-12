# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order do
  it 'should be initialized' do
    expect(described_class.new).to be_truthy
  end

  context 'validations' do
    it { should belong_to(:shop) }
  end
end
