class AddCurrentSignInIpToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :current_sign_in_ip, :inet
  end
end
