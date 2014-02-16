class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
  # attr_accessible :title, :body
  mount_uploader :avatar, AvatarUploader
  attr_accessible :username, :email, :password, :password_confirmation, :first, :last, :phone, :friend_karma, :favors_done, :favors_received, :avatar, :invitor, :invitee

  has_many :memberships
  has_many :groups, through: :memberships
  has_many :authentications, dependent: :destroy

  accepts_nested_attributes_for :authentications

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  validates_uniqueness_of :email, :phone

  has_many :memberships
  has_many :jobs, through: :memberships
  has_many :groups, through: :memberships
  has_many :requests, through: :memberships
  has_many :requests, through: :memberships
  has_many :created_invitations, foreign_key: "invitor_id"
  has_many :received_invitations, foreign_key: "invitee_id"

end
