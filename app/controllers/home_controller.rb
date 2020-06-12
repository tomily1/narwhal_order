# frozen_string_literal: true

class HomeController < AuthenticatedController
  def index
    @orders = Order.paginate(page: params[:page], per_page: params[:per_page] || 12)
  end
end
