class InterestedUserController < ApplicationController

  skip_before_filter :require_login
  def create
	  @job = Job.new(params[:job])

	  respond_to do |format|
		if @job.save
			format.html { redirect_to dashboard_url, notice: 'Job was successfully created.' }
			format.json { render json: @job, status: :created, location: @job }
		else
			format.html { render action: "new" }
			format.json { render json: @job.errors, status: :unprocessable_entity }
		end
	end
  end
  def index
	  @interested_user = InterestedUser.new
  end
end
