class Job < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user}

  attr_accessible :friend_karma_value, :group_id, :membership_id, :name,  :asked, :accepted, :flaky, :completed, :duration

  belongs_to :group
  belongs_to :membership
  has_many :requests
  has_many :comments

  validates_presence_of :friend_karma_value, :group_id, :membership_id, :name, :duration

end

# == Schema Information
#
# Table name: jobs
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  friend_karma_value :integer
#  group_id           :integer
#  membership_id      :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  asked              :boolean
#  flaky              :boolean
#  accepted           :boolean
#  acceptor_id        :integer
#  completed          :boolean          default(FALSE)
#  duration           :integer
#
