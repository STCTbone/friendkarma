class ChangeCommentAndRequestToBelongToMembership < ActiveRecord::Migration
  def change
    change_table :comments do |c|
        c.rename :user_id, :membership_id
    end
    change_table :requests do |r|
        r.rename :user_id, :membership_id
    end
  end

  def down
  end
end
