class Comment < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user}

  attr_accessible :comment_text, :job_id, :membership_id

  belongs_to :job
  belongs_to :membership

  validates_presence_of :comment_text, :job_id, :membership_id
end

# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  comment_text  :text
#  membership_id :integer
#  job_id        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
