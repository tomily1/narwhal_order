class OrdersUpdateJob < OrdersJob
  protected

  def process_order(_current_shop, order_params)
    Order.where(shopify_order_id: order_params[:shopify_order_id]).update(order_params)
  end
end
