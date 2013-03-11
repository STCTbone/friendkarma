class AddFavorsCounterToUser < ActiveRecord::Migration
  def change
    add_column :users, :favors_done, :integer, default: 0
    add_column :users, :favors_received, :integer, default: 0
  end
end
