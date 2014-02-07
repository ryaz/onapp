# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Ticket.delete_all
20.times do |i|
  Ticket.create(status: Ticket::STATUSES.sample,
    name: "name #{i}",
    email: "foo#{i}@bar.com",
    subject: /\w{5}/.gen,
    body: /[:sentence:]/.gen)
end
