require 'httparty'

class Ticket_collector
  attr_reader :code
  attr_reader :tickets

  def initialize(basic_auth)
    url = "https://michebble.zendesk.com/api/v2/tickets.json"
    response = call_api(url, basic_auth)
    @code = response.code
    code == 200 ? @tickets = response.parsed_response["tickets"] : raise("ConectionError") 
  end

  def call_api(url, basic_auth)
    begin
      HTTParty.get(url, basic_auth: basic_auth)
    rescue StandardError
      { code => false }
    end
  end
end