class User < ActiveRecord::Base
  attr_accessible :email, :friend_karma, :name
end
