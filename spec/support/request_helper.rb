# frozen_string_literal: true

module RequestHelper
  def login(shop)
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:shopify,
                             provider: 'shopify',
                             uid: shop.shopify_domain,
                             credentials: { token: shop.shopify_token })
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:shopify]

    get '/auth/shopify'
    follow_redirect!
  end

  def order_webhook(id: 2_503_261_257_886, item_name: 'IPod Nano - 8GB')
    {
      'id' => id,
      'email' => 'jon@doe.ca',
      'order_number' => '1234',
      'line_items' => [
        {
          "id": 866_550_311_766_439_020,
          "variant_id": nil,
          'title' => item_name,
          'name' => item_name
        }
      ],
      'customer' => {
        'first_name' => 'John',
        'last_name' => 'Smith'
      }
    }
  end
end
