if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
#  ActionMailer::Base.delivery_method = :sendmail
  ActionMailer::Base.smtp_settings = {
#    address:                   'smtp.sendgrid.net',
    port:                      '587',
    authentication:            :login,
#    user_name:                 ENV['SENDGRID_USERNAME'],
#    password:                  ENV['SENDGRID_PASSWORD'],
#    domain:                    'heroku.com',
#    enable_starttls_auto:      true
#    address:                   'smtp.gmail.com',
    address:                   'mail.tylerskeen.com',
#    port:                      587,
    domain:                    'tylerskeen.com',
    user_name:                 'contact@tylerskeen.com',
#    authentication:            :plain,
 #   user_name:                 'christhompson@tylerskeen.com',#ENV['DREAMHOST_USERNAME'],
    password:                  ENV['DREAMHOST_PASSWORD'],
  #  enable_starttls_auto:      true
    enable_starttls_auto:      false
  }
  ActionMailer::Base.perform_deliveries = true
  ActionMailer::Base.raise_delivery_errors = true

end
