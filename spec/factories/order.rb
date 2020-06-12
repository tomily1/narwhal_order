FactoryBot.define do
  factory :order do
    shopify_order_id { '2503261257886' }
    shopify_order_number { '1024' }
    shopify_customer_name { 'Nipi Tiri' }
    association :shop
  end
end
