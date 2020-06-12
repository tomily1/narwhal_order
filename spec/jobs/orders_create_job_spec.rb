# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersCreateJob do
  subject(:worker) { described_class.new }
  let(:shop) { create(:shop) }

  context 'Narwhal order' do
    it 'creates an order for the shop' do
      worker.perform(
        shop_domain: shop.shopify_domain,
        webhook: order_webhook(item_name: 'narwhal shirt')
      )
      expect(shop.reload.orders.count).to eq 1
    end
  end

  context 'non-narwhal order' do
    it 'does not create an order for the shop' do
      worker.perform(
        shop_domain: shop.shopify_domain,
        webhook: order_webhook
      )
      expect(shop.reload.orders.count).to eq 0
    end
  end
end
