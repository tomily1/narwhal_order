ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = Rails.application.credentials.shopify[:key]
  config.secret = Rails.application.credentials.shopify[:secret]
  config.old_secret = ""
  config.scope = "read_products" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2020-04"
  config.shop_session_repository = 'Shop'
  config.webhooks = [
    {topic: 'app/uninstalled', address: "#{ENV['WEBHOOK_HOST']}/app_uninstalled", format: 'json'},
    {topic: 'orders/delete', address: "#{ENV['WEBHOOK_HOST']}/orders_delete", format: 'json'},
    {topic: 'orders/create', address: "#{ENV['WEBHOOK_HOST']}/orders_create", format: 'json'},
    {topic: 'orders/updated', address: "#{ENV['WEBHOOK_HOST']}/orders_updated", format: 'json'}
  ]
end

# ShopifyApp::Utils.fetch_known_api_versions                        # Uncomment to fetch known api versions from shopify servers on boot
# ShopifyAPI::ApiVersion.version_lookup_mode = :raise_on_unknown    # Uncomment to raise an error if attempting to use an api version that was not previously known
