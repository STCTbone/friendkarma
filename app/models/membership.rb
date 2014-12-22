class Membership < ActiveRecord::Base
  attr_accessible :group_id, :user_id
  belongs_to :user
  belongs_to :group

  has_many :jobs
  has_many :comments
  has_many :requests
end

# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
