class UserMailer < ActionMailer::Base
  default from: 'notifications@onapp.com'

  def ticket(ticket, subject, status)
    @ticket = ticket
    @status = status
    @url  = 'http://lvh.me:3006'
    mail(to: @ticket.email, subject: subject)
  end
end
