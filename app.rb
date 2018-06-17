require_relative 'lib/ticket_collector'
require_relative 'lib/ticket_viewer'
require_relative 'lib/interface'

basic_auth = {username: "hebble.michael@gmail.com", password: "happypath"}

ticket_collector = Ticket_collector.new(basic_auth)
viewer = Ticket_viewer.new(ticket_collector.tickets)
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


