class InterestedUserController < ApplicationController

  skip_before_filter :require_login
  def create
	  @interested_user= InterestedUser.new(params[:interested_user])

	  respond_to do |format|
		if @interested_user.save
			InterestedMailer.signup(@interested_user.email).deliver
			format.html { redirect_to root_url, notice: 'Thanks for signing up!' }
			format.json { render json: @job, status: :created, location: @job }
		else
			format.html { render action: "index" }
			format.json { render json: @job.errors, status: :unprocessable_entity }
		end
	end
  end
  def index
	  @interested_user = InterestedUser.new
  end
end
