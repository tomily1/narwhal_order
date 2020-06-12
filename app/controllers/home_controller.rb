# frozen_string_literal: true

class HomeController < AuthenticatedController
  def index
    shop = Shop.find_by(shopify_domain: ShopifyAPI::Shop.current.domain)
    @orders = shop.orders.paginate(page: params[:page], per_page: params[:per_page])
  end
end
