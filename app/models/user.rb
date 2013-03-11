class User < ActiveRecord::Base
  authenticates_with_sorcery!
  # attr_accessible :title, :body
  mount_uploader :avatar, AvatarUploader
  attr_accessible :username, :email, :password, :password_confirmation, :first, :last, :phone, :friend_karma, :admin, :favors_done, :favors_received, :avatar

  has_many :memberships
  has_many :groups, through: :memberships

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  validates_uniqueness_of :email, :phone

  has_many :memberships
  has_many :jobs, through: :memberships
  has_many :groups, through: :memberships
  has_many :requests, through: :memberships
  has_many :requests, through: :memberships
end
