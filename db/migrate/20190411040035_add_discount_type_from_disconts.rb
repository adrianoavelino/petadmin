class AddDiscountTypeFromDisconts < ActiveRecord::Migration[5.0]
  def change
    add_column :discounts, :discount_type, :integer
  end
end
