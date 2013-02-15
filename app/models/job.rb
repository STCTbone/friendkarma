class Job < ActiveRecord::Base
  attr_accessible :friend_karma_value, :group_id, :membership_id, :name, :time
end
