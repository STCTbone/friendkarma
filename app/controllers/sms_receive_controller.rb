 SmsReceiveController < ApplicationController

   def index 
     #   let's pretend that we've mapped this action to 
        # http://localhost:3000/sms in the routes.rb file
            
      message_body = params["Body"]
      from_number = params["From"]
      user = User.find_by_phone(from_number)
      unless user == nil
        Comment.create(comment_text: message_body, job_id:  , membership_id: 
                     
     SMSLogger.log_text_message from_number, message_body
     
  end
end
