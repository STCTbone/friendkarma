class RequestsController < ApplicationController

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.json
  def new
    @request = Request.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(params[:request])

    @request.job_id = params[:job_id]
    @request.membership_id = current_user.memberships.where(group_id: @request.job.group.id).first.id
    respond_to do |format|
      if @request.save
        RequestsMailer.request_made(current_user, @request.job, @request).deliver
       # SmsController.new.request_created(@request.job, @request)
        format.html { redirect_to dashboard_url, notice: 'Request was successfully created.' }
        format.json { render json: @request, status: :created, location: @request }
      else
        format.html { render action: "new" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.json
  def update
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        RequestsMailer.request_modified(current_user,@request.job,@request).deliver
        format.html { redirect_to dashboard_url, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request = Request.find(params[:id])
    RequestsMailer.request_deleted(current_user, @request.job, @request).deliver
    @request.destroy

    respond_to do |format|
      format.html { redirect_to dashboard_url }
      format.json { head :no_content }
    end
  end

    def accepted
      request = Request.find(params[:id])
      request.acceptor_id = current_user.id

      request.save

      redirect_to dashboard_url, notice: "Request accepted!"
    end


    # WAZZZZZUUPPP
	def completed_request
		request = Request.find(params[:id])
		request_owner = request.user
		request_owner.favors_received += 1
		request_owner.save
		request_doer = request.job.user
		request_doer.favors_done += 1
		request_doer.save
		request.completed = true
		request.save
		redirect_to dashboard_url, notice: "Request completed!"
	end
end
