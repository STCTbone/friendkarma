class SmsController < ApplicationController

      def index
      end
       
      def request_created(job, request)
        number_to_send_to = job.membership.user.phone
             
        twilio_sid = "AC33e9ab199968397d33f2398abf9ae19a"
        twilio_token = "c0f8a724ec1305fef69c7a3fc4fc25bf"
        twilio_phone_number = "8627037633"
                         
        @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
                             
        @twilio_client.account.sms.messages.create(
          :from => "+1#{twilio_phone_number}",
          :to => number_to_send_to,
          :body => "Hi #{job.membership.user.first}, #{request.membership.user.first} #{request.membership.user.last} wants you to #{request.request_text} while you're doing #{job.name}. Reply to this text to leave a comment!"
          )
      end
end


