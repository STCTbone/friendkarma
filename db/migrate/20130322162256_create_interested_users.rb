class CreateInterestedUsers < ActiveRecord::Migration
  def change
    create_table :interested_users do |t|

      t.timestamps
    end
  end
end
