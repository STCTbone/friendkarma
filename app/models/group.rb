class Group < ActiveRecord::Base
  attr_accessible :name
  has_many :users, through: :memberships
  has_many :memberships
  has_many :jobs
  has_many :requests, through: :jobs
  has_many :comments, through: :jobs

  validates_presence_of :name
end
