class CastomerMailer < ActionMailer::Base
  default from: "voytas1991@gmail.com"
  
  def welcom_email(ticket, send_customer)
    @ticket = ticket
    @send_customer = send_customer
    @url = "localhost:3000/ticket/#{@ticket.current_url}"
    mail( to: @send_customer.email, subject: 'Created New Ticket')
  end
end


