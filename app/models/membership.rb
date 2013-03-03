class Membership < ActiveRecord::Base
  attr_accessible :group_id, :user_id
  belongs_to :user
  belongs_to :group

  has_many :jobs
  has_many :comments
  has_many :requests
end
