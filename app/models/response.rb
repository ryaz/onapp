class Response < ActiveRecord::Base
  belongs_to :ticket

  validates :text, presence: true

  before_save :set_owner
  after_create :notify_customer

  private

  def set_owner
    self.user_id = ticket_id
  end

  def notify_customer
    UserMailer.ticket(ticket, 'Someone has edited the ticket', 'updated', self).deliver
  end
end
