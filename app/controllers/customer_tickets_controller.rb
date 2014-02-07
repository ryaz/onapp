class CustomerTicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to [:new, :customer_ticket], notice: 'Ticket was successfully created.'
    else
      render action: 'new'
    end
  end

  private

    def ticket_params
      params.require(:ticket).permit(:name, :email, :subject, :body)
    end
end