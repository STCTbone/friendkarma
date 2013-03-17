class JobsController < ApplicationController

  before_filter :is_user_or_admin, except: [:index, :new, :create, :completed_job, :accepted]

  def is_user_or_admin
    unless (current_user.id == Job.find_by_id(params[:id].to_i).membership.user.id ) || (current_user.admin)
      redirect_to root_path, notice: "Access Denied"
    end
  end

  hide_action :current_user

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
    @job.friend_karma_value = 100
    @job.membership_id = Membership.where("user_id = ? AND group_id = ?", current_user.id, @job.group).first.id
    respond_to do |format|
      if @job.save
        @job.group.users.each do |user|
          if user != current_user
            JobsMailer.job_created(user, @job).deliver
          end
        end
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
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
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
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
        format.html { redirect_to jobs_url }
        format.json { head :no_content }
      end
  end
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

    def accepted
      job = Job.find(params[:id])
      job.acceptor_id = current_user.id
      job.accepted = true

      job.save

      redirect_to jobs_url, notice: "Job accepted!"
    end
end
