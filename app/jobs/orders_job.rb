class OrdersJob < ApplicationJob

  def perform(shop_domain:, webhook:)
    line_items = webhook['line_items']
    return unless line_items.nil? || narwhal_exists_for(line_items)
    handle_webhook(shop_domain: shop_domain, webhook: webhook)
  end

  protected

  def handle_webhook(shop_domain:, webhook:)
    current_shop = shop(shop_domain)
    current_shop.with_shopify_session do
      order =
        {
          shopify_order_id: webhook['id'],
          shopify_order_number: webhook['order_number'],
          shopify_customer_name: name_for(webhook['customer'])
        }
      order = Order.where(shopify_order_id: order[:shopify_order_id]).first_or_create(order)
      current_shop.orders << order
    end
  end

  def narwhal_exists_for(line_items)
    line_items.any? { |item| (item ['name'] =~ /narwhal/) || (item ['name'] =~ /narwhal/) }
  end

  def shop(shop_domain)
    Shop.find_by(shopify_domain: shop_domain)
  end

  def name_for(customer)
    "#{customer[:first_name]} #{customer[:last_name]}"
  end
end
