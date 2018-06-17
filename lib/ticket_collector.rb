require 'httparty'

class Ticket_collector
  attr_reader :code
  attr_reader :tickets

  def initialize(url, basic_auth)
    response = call_api(url, basic_auth)
    @code = response.code
    if code == 200
      @tickets = response.parsed_response["tickets"] 
    else 
      raise "ConectionError"
    end 
  end

  def call_api(url, basic_auth)
    begin
      HTTParty.get(url, basic_auth: basic_auth)
    rescue StandardError
      { code => false }
    end
  end
end