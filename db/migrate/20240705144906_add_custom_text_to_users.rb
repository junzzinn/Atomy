class AddCustomTextToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :custom_text, :string
  end
end
