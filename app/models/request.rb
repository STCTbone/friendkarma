class Request < ActiveRecord::Base
  attr_accessible :job_id, :request_text, :user_id
end
