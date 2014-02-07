class AddResponseToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :response, :text
    add_column :tickets, :user_id, :integer
  end
end
