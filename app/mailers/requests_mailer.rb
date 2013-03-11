class RequestsMailer < ActionMailer::Base
  default from: "from@example.com"

  def request_made(user, job, request)
   @user = user
   @job = job
   mail(to: job.membership.user.email, subject: "FriendKarma - REQUEST #{job.name} from #{user.first} #{user.last}")
  end

  def request_deleted(user, job, request)
   @user = user
   @job = job
   mail(to: job.membership.user.email, subject: "FriendKarma - REQUEST DELETED #{job.name} from #{user.first} #{user.last}")
  end


  def request_modified(user,job, request)
   @user = user
   @job = job
   mail(to: job.membership.user.email, subject: "FriendKarma - REQUEST MODIFIED #{job.name} from #{user.first} #{user.last}")
  end
end
