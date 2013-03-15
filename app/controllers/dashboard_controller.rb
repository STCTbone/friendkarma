class DashboardController < ApplicationController

  def index
    @jobs = current_user.jobs
    @groups = current_user.groups
    @activities = PublicActivity::Activity.order("created_at desc")






  end
end
