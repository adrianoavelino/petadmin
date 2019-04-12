class RemoveTypeFromDiscounts < ActiveRecord::Migration[5.0]
  def change
    remove_column :discounts, :type, :integer
  end
end
