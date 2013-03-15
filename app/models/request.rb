class Request < ActiveRecord::Base
  include PublicActivity::Model
  tracked
  attr_accessible :job_id, :request_text, :membership_id

  belongs_to :job
  belongs_to :membership

  validates_presence_of :job_id, :request_text, :membership_id
end
