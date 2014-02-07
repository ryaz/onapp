# == Schema Information
#
# Table name: tickets
#
#  id         :integer          not null, primary key
#  status     :string(255)
#  name       :string(255)
#  email      :string(255)
#  subject    :string(255)
#  body       :text
#  uid        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Ticket < ActiveRecord::Base
  searchkick

  include PublicActivity::Model
  tracked

  STATUSES = [
    WAIT_STAFF = 'waiting_staff'.freeze,
    WAIT_CUSTOMER = 'waiting_customer'.freeze,
    HOLD = 'hold'.freeze,
    CANCELLED = 'cancelled'.freeze,
    COMPLETED = 'completed'.freeze
    ]

  STATUSES.each do |status|
    scope status, -> {where(status: status)}
  end
  scope :closed, -> {where("status = ? OR status = ?", CANCELLED, COMPLETED)}

  before_save :set_status, :set_uid, on: create

  with_options presence: true do |this|
    this.validates :name, length: {maximum: 255}
    this.validates :email, format: {with: Devise.email_regexp}
    this.validates :subject
    this.validates :body
  end

  private

  def set_status
    self.status = WAIT_STAFF
  end

  def set_uid
    self.uid = /\w{3}-\d{3}-\w{3}-\d{3}-\w{3}/i.gen.upcase
  end
end
