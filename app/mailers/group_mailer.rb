class GroupMailer < ActionMailer::Base
  default from: "from@example.com"

  def invite_to_group(invitor_id, invitee_email, group_id)
    @invitor_id = invitor_id
    @invitee_email = invitee_email
    @group_id = group_id
    mail(to: invitee_email, subject: "FriendKarma - #{invitor_id} has invited you to join the group: #{group_id}!")
  end

end

