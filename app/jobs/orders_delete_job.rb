class OrdersDeleteJob < OrdersJob
  def handle_webhook(shop_domain:, webhook:)
    current_shop = shop(shop_domain)
    current_shop.with_shopify_session do
      order = Order.where(shopify_order_id: webhook[:id]).first

      order.destroy if order.present?
    end
  end
end
