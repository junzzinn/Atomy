class AddProductQuantityToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :product_quantity, :integer
  end
end
