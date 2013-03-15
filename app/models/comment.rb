class Comment < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user}

  attr_accessible :comment_text, :job_id, :membership_id

  belongs_to :job
  belongs_to :membership

  validates_presence_of :comment_text, :job_id, :membership_id
end
