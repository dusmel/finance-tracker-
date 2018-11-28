class AddFirstNameAndLastNameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string, :before => "email"
    add_column :users, :last_name, :string, :before => "email"
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
