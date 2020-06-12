# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ShopifyApp::WebhooksController', type: :routing do
  %w[orders_delete orders_create orders_updated].each do |topic|
    it "routes to action: recieve and type #{topic}" do
      expect(post: "/webhooks/#{topic}").to route_to(
        'controller' => 'shopify_app/webhooks',
        'action' => 'receive',
        'type' => topic.to_s
      )
    end
  end
end
