require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:shop) { create(:shop) }

  before do
    login(shop)
    @request.session[:shopify] = shop.id
    @request.session[:shopify_domain] = shop.shopify_domain
    get root_path
  end

  describe "GET /" do
    it "return with a HTTP status 200" do
      expect(response).to have_http_status(200)
    end

    context 'without narwhal orders' do
      it "displays message" do
        expect(response.body).to match(/No narwhal order./)
      end
    end

    context 'with narwhal orders' do
      before do
        @order = create(:order)
        shop.orders << @order
        get root_path
      end

      it 'displays the orders' do
        expect(response.body).to match(/Nipi Tiri/)
        expect(response.body).to match(/ORDER ##{@order.shopify_order_number}/)
      end
    end
  end
end
