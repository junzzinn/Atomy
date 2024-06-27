class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :bio
      t.integer :product_quantity

      t.timestamps
    end
  end
end
