class JobsMailer < ActionMailer::Base
  default from: "from@example.com"

  def job_created(user, job)
    @user = user
    @job = job
    mail(to: user.email, subject: "FriendKarma - #{job.name} at #{job.time}")
  end
  
  def job_deleted(user, job)
    @user = user
    @job = job
    mail(to: user.email, subject: "FriendKarma - DELETED: #{job.name} at #{job.time}")
  end

  def job_completed(user, job)
    @user = user
    @job = job
    mail(to: user.email, subject: "FriendKarma - COMPLETED: #{job.name} at #{job.time}")
  end

end
