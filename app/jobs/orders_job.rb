# frozen_string_literal: true

class OrdersJob < ApplicationJob
  def perform(shop_domain:, webhook:)
    line_items = webhook['line_items']
    if line_items.nil? || !narwhal_exists_for(line_items)
      check_or_delete_order(shop_domain: shop_domain, webhook: webhook)
    else
      handle_webhook(shop_domain: shop_domain, webhook: webhook)
    end
  end

  protected

  def check_or_delete_order(shop_domain:, webhook:)
    current_shop = shop(shop_domain)
    current_shop.with_shopify_session do
      order = Order.where(shopify_order_id: webhook['id']).first

      order.destroy if order.present?
    end
  end

  def handle_webhook(shop_domain:, webhook:)
    current_shop = shop(shop_domain)
    current_shop.with_shopify_session do
      order_params = {
        shopify_order_id: webhook['id'],
        shopify_order_number: webhook['order_number'],
        shopify_customer_name: name_for(webhook['customer'])
      }

      process_order(current_shop, order_params)
    end
  end

  def narwhal_exists_for(line_items)
    line_items.any? { |item| (item ['name'] =~ /narwhal/) || (item ['name'] =~ /narwhal/) }
  end

  def shop(shop_domain)
    Shop.find_by(shopify_domain: shop_domain)
  end

  def name_for(customer)
    "#{customer['first_name']} #{customer['last_name']}"
  end
end
