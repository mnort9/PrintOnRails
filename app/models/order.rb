class Order < ActiveRecord::Base
  attr_accessible :color_back, :color_front, :color_sleeve, :end_date, :name, :start_date, :whiteboard
end