class OrderCategory < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :orders
end
