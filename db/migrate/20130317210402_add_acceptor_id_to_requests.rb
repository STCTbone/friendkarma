class AddAcceptorIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :acceptor_id, :integer
  end
end
