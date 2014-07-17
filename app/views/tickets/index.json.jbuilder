json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :type, :body, :date
  json.url ticket_url(ticket, format: :json)
end
