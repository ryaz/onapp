class UserMailer < ActionMailer::Base
  default from: 'notifications@onapp.herokuapp.com'

  def ticket(ticket, subject, status, reply = nil)
    @ticket = ticket
    @status = status
    @reply = reply
    @url  = 'http://onapp.herokuapp.com/'
    mail(to: @ticket.email, subject: subject)
  end
end
