require 'httparty'

class Ticket_collector
  attr_reader :code
  attr_reader :tickets

  def initialize
    response = call_api
    @code = response.code
    body = response.parsed_response
    @tickets = body["tickets"]
  end

  def call_api
    url = "https://michebble.zendesk.com/api/v2/tickets.json"
    basic_auth = {username: "hebble.michael@gmail.com", password: "happypath"}
    begin
      HTTParty.get(url, basic_auth: basic_auth)
    rescue
      nil
    end
  end
end