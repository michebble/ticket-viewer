require 'httparty'

class Ticket_collector
  attr_reader :code
  attr_reader :tickets

  def initialize(basic_auth)
    @basic_auth = basic_auth
    @tickets = return_all_tickets
  end

  def call_api(page_num)
    url = "https://michebble.zendesk.com/api/v2/tickets.json?page=" + page_num.to_s
    begin
      HTTParty.get(url, basic_auth: @basic_auth)
    rescue StandardError
      { code => false }
    end
  end

  def return_all_tickets
    collected_tickets = Array.new
    page_num = 1
    loop do
      response = call_api(page_num)
      response.code == 200 ? collected_tickets.push(response["tickets"]).flatten! : raise("ConectionError")
      collected_tickets.length == response["count"] ? break : page_num += 1
    end
    collected_tickets
  end
end