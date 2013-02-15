class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :job_id
      t.integer :user_id
      t.text :request_text

      t.timestamps
    end
  end
end
