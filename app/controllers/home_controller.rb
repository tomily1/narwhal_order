# frozen_string_literal: true

class HomeController < AuthenticatedController
  def index
    @orders = ShopifyAPI::Order.find(:all, params: { limit: 10 })
  end
end
