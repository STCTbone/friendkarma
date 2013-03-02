class AddFirstLastAdminPhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first, :string
    add_column :users, :last, :string
    add_column :users, :phone, :string
    add_column :users, :admin, :boolean
  end
end
