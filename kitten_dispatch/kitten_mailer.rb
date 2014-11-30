require 'action_mailer'

ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    address: ENV['KITTEN_SMTP_ADDRESS'],
    port: Integer(ENV['KITTEN_SMTP_PORT']),
    authentication: :plain,
    domain: ENV['KITTEN_SMTP_DOMAIN'],
    user_name: ENV['KITTEN_SMTP_USERNAME'],
    password: ENV['KITTEN_SMTP_PASSWORD'],
    enable_starttls_auto: true
  }

module KittenDispatch
  
  class KittenMailer < ActionMailer::Base
    
    def mail_kitten(hash)
      # Load values from the hash
      recipient = hash[:recipient]
      caption = hash[:caption]
      file_path = hash[:file_path]
            
      # Prepare the email
      attachments.inline['photo.png'] = File.read(file_path)
      email = mail(to: recipient, from: ENV['KITTEN_SMTP_FROM_EMAIL'], subject: caption, body: caption)
      
      # Send the email
      email.deliver
    end
    
  end
end