# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shop do
  context 'new user' do
    it 'should be initialized' do
      expect(described_class.new).to be_truthy
    end

    it 'should be validated' do
      expect(described_class.new.valid?).to eq false
    end

    it 'should be created if valid' do
      expect do
        described_class.create(
          shopify_domain: "example#{rand(100)}.myshopify.com",
          shopify_token: '451a2b3er28e07d89iy3df0'
        )
      end.to change { Shop.count }.by(1)
    end

    it 'should not created without shopify domain' do
      shop = described_class.new(
        shopify_token: '451a2b3er28e07d89iy3df0'
      )
      expect(shop.save).to eq false
    end
  end

  context 'relationship and validation' do
    it { should have_many(:orders) }
    it { should validate_presence_of(:shopify_domain) }
  end
end
