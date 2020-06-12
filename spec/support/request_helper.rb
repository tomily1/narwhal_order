module RequestHelper
  def login(shop)
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:shopify,
    provider: 'shopify',
    uid: shop.shopify_domain,
    credentials: { token: shop.shopify_token })
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:shopify]
        
    get "/auth/shopify"
    follow_redirect!
  end

  def order_webhook(id: 2503261257886, item_name: "IPod Nano - 8GB")
    {
      "id" => id,
      "email" => "jon@doe.ca",
      "order_number" => "1234",
      "line_items" => [
        {
          "id": 866550311766439020,
          "variant_id": nil,
          "title" => item_name,
          "name" => item_name,
        },
      ],
      "customer" => {
        "first_name" => "John",
        "last_name" => "Smith"
      }
    }
  end
end
