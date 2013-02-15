class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.integer :friend_karma_value
      t.datetime :time
      t.integer :group_id
      t.integer :membership_id

      t.timestamps
    end
  end
end
