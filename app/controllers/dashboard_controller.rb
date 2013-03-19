class DashboardController < ApplicationController

  def index
    @jobs = current_user.jobs
    @groups = current_user.groups
    if params[:filter] == "Requests"
    @activities = PublicActivity::Activity.order("created_at desc").where(trackable_type: "Request")
    elsif params[:filter] == "Offers"
    @activities = PublicActivity::Activity.order("created_at desc").where(trackable_type: "Job")
    else
    @activities = PublicActivity::Activity.order("created_at desc")
    end
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
