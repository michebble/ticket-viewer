require 'httparty'

class Ticket_collector
  attr_reader :code
  attr_reader :tickets

  def initialize(url, basic_auth)
    response = call_api(url, basic_auth)
    @code = response.code
    body = response.parsed_response
    @tickets = body["tickets"]
  end

  def call_api(url, basic_auth)
    begin
      HTTParty.get(url, basic_auth: basic_auth)
    rescue
      nil
    end
  end
end