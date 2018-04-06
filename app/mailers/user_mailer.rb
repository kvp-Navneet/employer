class UserMailer < ApplicationMailer
	default from: 'notifications@employer.com'
 
  def reset_email(emp,rest_link)
    @emp = emp
    @url  = rest_link
    mail(to: @emp.email, subject: 'Reset password')
  end
end
