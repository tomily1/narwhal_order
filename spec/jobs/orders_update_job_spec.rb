# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersUpdateJob do
  subject(:worker) { described_class.new }
  let(:order) { create(:order) }
  let(:shop) { order.shop }

  context 'Narwhal order' do
    it 'updates customer name for the order' do
      expect(order.shopify_customer_name).to eq 'Nipi Tiri'
      worker.perform(
        shop_domain: shop.shopify_domain,
        webhook: order_webhook(id: order.shopify_order_id, item_name: 'narwhal shirt')
      )

      expect(order.reload.shopify_customer_name).to eq 'John Smith'
    end
  end

  context 'non-narwhal order' do
    it 'does not update and removes the order' do
      worker.perform(
        shop_domain: shop.shopify_domain,
        webhook: order_webhook
      )

      expect(shop.reload.orders.count).to eq 0
    end
  end
end
