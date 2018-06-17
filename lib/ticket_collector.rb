require 'net/http'
require 'uri'
require 'json'

class Ticket_collector
  attr_reader :code
  attr_reader :tickets

  def initialize
    response = call_api
    @code = response.code
    body = JSON.parse(response.body)
    @tickets = body["tickets"]
  end

  def call_api
    uri = URI.parse("https://michebble.zendesk.com/api/v2/tickets.json")
    request = Net::HTTP::Get.new(uri)
    request.basic_auth("hebble.michael@gmail.com", "happypath")
    req_options = {
      use_ssl: uri.scheme == "https"
    }
    begin
      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
    rescue
      response = nil
    end
  end
end