require 'net/http'
require 'uri'

class Api_connect
  attr_reader :code

  def initialize
    uri = URI.parse("https://michebble.zendesk.com/api/v2/tickets.json")
    request = Net::HTTP::Get.new(uri)
    request.basic_auth("hebble.michael@gmail.com", "happypath")

    req_options = {
      use_ssl: uri.scheme == "https"
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    @code = response.code 
  end
end
