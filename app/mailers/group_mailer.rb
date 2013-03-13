class GroupMailer < ActionMailer::Base
  default from: "from@example.com"

  def invite_to_group(invitor, invitee_email, group_id)
    @invitor = invitor
    @invitee_email = invitee_email
    @group_id = group_id
    mail(to: invitee_email, subject: "FriendKarma - #{invitor} has invited you to join the group: #{group_id.name}!")
  end

end

