# frozen_string_literal: true

FactoryBot.define do
  factory :shop do
    shopify_domain { "example#{rand(100)}.myshopify.com" }
    shopify_token { '451a2b3er28e07d89iy3df0' }
  end
end
