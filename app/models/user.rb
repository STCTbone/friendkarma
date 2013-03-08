class User < ActiveRecord::Base
  authenticates_with_sorcery!
  # attr_accessible :title, :body
  attr_accessible :username, :email, :password, :password_confirmation, :first, :last, :phone, :friend_karma, :admin

  has_many :memberships
  has_many :groups, through: :memberships

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  validates_uniqueness_of :email, :phone
end
