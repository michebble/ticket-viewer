require_relative 'lib/ticket_collector'
require_relative 'lib/ticket_viewer'

require 'pry'

tickets = Ticket_collector.new.tickets

viewer = Ticket_viewer.new(tickets)

binding.pry