json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :status, :name, :email, :subject, :body, :uid
  json.url ticket_url(ticket, format: :json)
end
