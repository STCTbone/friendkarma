class Invitation < ActiveRecord::Base
  attr_accessible :group_id, :invitee_email, :invitee_id, :invitor_id

  belongs_to :invitor, class_name: "User"
  belongs_to :invitee, class_name: "User"
  belongs_to :group

end
