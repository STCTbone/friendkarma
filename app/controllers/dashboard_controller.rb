class DashboardController < ApplicationController

  def index
    @jobs = current_user.jobs
    @groups = current_user.groups
    @activities = PublicActivity::Activity.order("created_at desc")
  end


  # def destroy
  #   @activity = PublicActivity::Activity.find(params[:id])
  #   @activity.destroy

  #   respond_to do |format|
  #     format.html { redirect_to dashboard_url }
  #     format.json { head :no_content }
  #   end
  # end


end
