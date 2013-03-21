class RemoveTimesAndAddDurationToJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :time
    remove_column :jobs, :end_time
    add_column :jobs, :duration, :integer
  end

end
