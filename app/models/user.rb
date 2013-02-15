class User < ActiveRecord::Base
  attr_accessible :email, :friend_karma, :name

  has_many :groups, through: :memberships
  has_many :jobs, through: :memberships
  has_many :requests
  has_many :comments

  validates_presence_of :email, :friend_karma, :name
  validates_uniqueness_of :email



end
