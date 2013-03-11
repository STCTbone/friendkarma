class AddAcceptorIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :acceptor_id, :integer
  end
end
