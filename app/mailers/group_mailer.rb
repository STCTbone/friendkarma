class GroupMailer < ActionMailer::Base
  default from: "from@example.com"

  def invite_to_group(invitor, invitee_email, group)
    @invitor = invitor
    @invitee_email = invitee_email
    @group = group
    mail(to: invitee_email, subject: "FriendKarma - #{invitor} has invited you to join the group: #{group.name}!")
  end

end

