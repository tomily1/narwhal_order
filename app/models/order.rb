class Order < ActiveRecord::Base
  belongs_to :shop
  self.per_page = 10
end
