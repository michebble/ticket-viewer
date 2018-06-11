require_relative 'lib/ticket_collector'
require_relative 'lib/ticket_viewer'
require_relative 'lib/interface'
require 'pry'

tickets = Ticket_collector.new.tickets
viewer = Ticket_viewer.new(tickets)
interface = Interface.new(viewer)



binding.pry