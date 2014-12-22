class InterestedUser < ActiveRecord::Base
   attr_accessible :email
end

# == Schema Information
#
# Table name: interested_users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string(255)
#
