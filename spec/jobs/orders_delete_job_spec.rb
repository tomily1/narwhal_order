# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersDeleteJob do
  subject(:worker) { described_class.new }
  let(:order) { create(:order) }
  let(:shop) { order.shop }

  context 'Narwhal order' do
    it 'deletes the order' do
      worker.perform(
        shop_domain: shop.shopify_domain,
        webhook: order_webhook(id: order.shopify_order_id)
      )

      expect(shop.reload.orders.count).to eq 0
    end
  end
end
