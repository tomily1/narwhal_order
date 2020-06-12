class OrdersDeleteJob < OrdersJob
  def perform(shop_domain:, webhook:)
    check_or_delete_order(shop_domain: shop_domain, webhook: webhook)
  end
end
