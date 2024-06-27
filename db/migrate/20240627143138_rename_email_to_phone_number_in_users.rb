class RenameEmailToPhoneNumberInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :email, :phone_number
  end
end
