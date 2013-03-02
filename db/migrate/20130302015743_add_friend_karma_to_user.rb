class AddFriendKarmaToUser < ActiveRecord::Migration
  def change
    add_column :users, :friend_karma, :integer
  end
end
