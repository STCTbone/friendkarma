class Request < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user}
  attr_accessible :job_id, :request_text, :membership_id

  belongs_to :job
  belongs_to :membership

  validates_presence_of :job_id, :request_text, :membership_id

  def accepted?
    acceptor_id.present?
  end

end

# == Schema Information
#
# Table name: requests
#
#  id            :integer          not null, primary key
#  job_id        :integer
#  membership_id :integer
#  request_text  :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  completed     :boolean          default(FALSE)
#  acceptor_id   :integer
#
