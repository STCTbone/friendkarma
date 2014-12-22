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

# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  username                        :string(255)      not null
#  email                           :string(255)
#  crypted_password                :string(255)
#  salt                            :string(255)
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  first                           :string(255)
#  last                            :string(255)
#  phone                           :string(255)
#  admin                           :boolean
#  friend_karma                    :integer
#  remember_me_token               :string(255)
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string(255)
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  failed_logins_count             :integer          default(0)
#  lock_expires_at                 :datetime
#  unlock_token                    :string(255)
#  activation_state                :string(255)
#  activation_token                :string(255)
#  activation_token_expires_at     :datetime
#  favors_done                     :integer          default(0)
#  favors_received                 :integer          default(0)
#  avatar                          :string(255)
#
