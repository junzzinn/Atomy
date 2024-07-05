class AddUserTextToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :user_text, :text
  end
end
