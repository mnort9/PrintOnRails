class AddDescriptionToOrderPriority < ActiveRecord::Migration
  def change
    add_column :order_priorities, :description, :text
  end
end
