require_relative 'lib/ticket_collector'
require_relative 'lib/ticket_viewer'
require_relative 'lib/interface'

tickets = Ticket_collector.new.tickets
viewer = Ticket_viewer.new(tickets)
interface = Interface.new(viewer)
puts 'Welcome to the Zendesk ticket viewer'
interface.execute('list')
loop do
  input = gets.downcase.chomp
  if input == 'quit'
    break
  else
    interface.execute(input)
  end
end

puts "\nThank you for using the ticket viewer"


