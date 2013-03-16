class AddEndTimeToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :end_time, :datetime
  end
end
