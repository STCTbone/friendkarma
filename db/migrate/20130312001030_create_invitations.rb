class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :group_id
      t.integer :invitor_id
      t.integer :invitee_id
      t.string :invitee_email

      t.timestamps
    end
  end
end
