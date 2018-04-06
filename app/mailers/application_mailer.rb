class ApplicationMailer < ActionMailer::Base
  default from: 'notifications@employer.com'
  layout 'mailer'
end
