class AddEmailToInterestedUsers < ActiveRecord::Migration
  def change
    add_column :interested_users, :email, :string
  end
end
