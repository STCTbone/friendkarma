class Comment < ActiveRecord::Base
  attr_accessible :comment_text, :job_id, :user_id
end
