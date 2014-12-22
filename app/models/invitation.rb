class Invitation < ActiveRecord::Base
  attr_accessible :group_id, :invitee_email, :invitee_id, :invitor_id

  belongs_to :invitor, class_name: "User"
  belongs_to :invitee, class_name: "User"
  belongs_to :group

end

# == Schema Information
#
# Table name: invitations
#
#  id            :integer          not null, primary key
#  group_id      :integer
#  invitor_id    :integer
#  invitee_id    :integer
#  invitee_email :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
