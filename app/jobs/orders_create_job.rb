# frozen_string_literal: true

class OrdersCreateJob < OrdersJob
  protected

  def process_order(current_shop, order_params)
    order = Order
            .where(shopify_order_id: order_params[:shopify_order_id])
            .first_or_create(order_params)

    current_shop.orders << order
  end
end
