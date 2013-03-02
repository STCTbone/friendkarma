class Request < ActiveRecord::Base
  attr_accessible :job_id, :request_text, :membership_id

  belongs_to :job
  belongs_to :membership

  validates_presence_of :job_id, :request_text, :user_id
end
