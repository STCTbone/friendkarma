class JobsController < ApplicationController

  before_filter :is_user_or_admin, except: [:index, :new, :create, :completed_job]

  def is_user_or_admin
    unless (current_user.id == Job.find_by_id(params[:id].to_i).membership.user.id ) || (current_user.admin)
      redirect_to root_path, notice: "Access Denied"
    end
  end

  def is_admin
    unless current_user.admin
      redirect_to root_path, notice: "Access Denied"
    end
  end

  def index
    user_jobs = current_user.jobs
    @jobs = Job.where(id: current_user.jobs )

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.json
  def new
    @job = Job.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(params[:job])
    @job.friend_karma_value = 1
    @job.membership_id = Membership.where("user_id = ? AND group_id = ?", current_user.id, @job.group).first.id
    respond_to do |format|
      if @job.save
        @job.group.users.each do |user|
          if user != current_user
            JobsMailer.job_created(user, @job).deliver
          end
        end
        format.html { redirect_to dashboard_url, notice: 'Job was successfully created.' }
        format.json { render json: @job, status: :created, location: @job }
      else
        format.html { render action: "new" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.json
  def update
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to dashboard_url, notice: 'Job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    @job.requests.each do |request|
      user = request.user

      if user != current_user
        JobsMailer.job_completed(user, @job).deliver
      end

      respond_to do |format|
        format.html { redirect_to dashboard_url }
        format.json { head :no_content }
      end
  end

    def completed_job
      job = Job.find(params[:id])
      job.completed = true
  job.save
      if job.acceptor_id
  acceptor = User.find(job.acceptor_id)
  acceptor.favors_done += 1
  acceptor.save
  job.user.favors_received += 1
      end
      redirect_to dashboard_url, notice: "Job completed!"
    end

    def accepted
      job = Job.find(params[:id])
      job.acceptor_id = current_user.id
      job.accepted = true

      job.save

      redirect_to dashboard_url, notice: "Job accepted!"
    end
end
