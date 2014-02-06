class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :status
      t.string :name
      t.string :email
      t.string :subject
      t.text :body
      t.string :uid

      t.timestamps
    end
  end
end
