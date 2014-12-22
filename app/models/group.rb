class Group < ActiveRecord::Base
  attr_accessible :name
  has_many :users, through: :memberships
  has_many :memberships
  has_many :jobs
  has_many :requests, through: :jobs
  has_many :comments, through: :jobs
  has_and_belongs_to_many :invitations

  validates_presence_of :name
end

# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
