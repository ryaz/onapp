class CustomerTicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def edit; end

  def show; end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      UserMailer.ticket(@ticket, t('activity.ticket.create'), 'created').deliver
      redirect_to [:new, :customer_ticket], notice: 'Ticket was successfully created.'
    else
      render action: 'new'
    end
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
      @activities = PublicActivity::Activity.where(trackable: @ticket)
    end

    def ticket_params
      params.require(:ticket).permit(:name, :email, :subject, :body)
    end
end