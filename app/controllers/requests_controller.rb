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
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
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
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
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
    RequestsMailer.request_deleted(current_user,@request.job,@request).deliver
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end

    def accepted
      request = Request.find(params[:id])
      request.acceptor_id = current_user.id

      request.save

      redirect_to jobs_url, notice: "Request accepted!"
    end

        def completed_job
      job = Job.find(Request.find_by_id(params[:id]).job.id)
      job.completed
      user = job.membership.user
      if job.asked
        user.favors_received += 1
        user.save
        user = User.find_by_id(job.acceptor_id)
        user.favors_done += 1
        user.save
      else
        user.favors_done += job.requests.count
        job.requests.each do |request|
          user = request.membership.user
          user.favors_received += 1
          user.save
        end
      end
      redirect_to jobs_url, notice: "Job completed!"
    end

end
