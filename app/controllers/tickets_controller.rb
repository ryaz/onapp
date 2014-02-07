class TicketsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    status = params[:status] if Ticket::STATUSES.include?(params[:status])
    if status
      tickets = Ticket.send(status)
    else
      tickets = Ticket.all
    end
    @tickets = params[:query].present? ? tickets.search(params[:query], page: params[:page]) : tickets
  end

  def show; end

  def new
    @ticket = Ticket.new
  end

  def edit; end

  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ticket }
      else
        format.html { render action: 'new' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
      @activities = PublicActivity::Activity.where(trackable: @ticket)
    end

    def ticket_params
      params.require(:ticket).permit(:name, :email, :subject, :body, responses_attributes: [:id, :text, :_destroy])
    end
end