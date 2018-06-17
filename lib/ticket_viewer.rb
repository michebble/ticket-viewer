require 'time'

class Ticket_viewer
  OFFSET = 25
  attr_reader :tickets

  def initialize(tickets)
    @tickets = tickets
    @last_page = (tickets.length/OFFSET.to_f).ceil-1
    @current_page = 0
  end

  def next
    @current_page == @last_page ? page_limit : @current_page += 1
    list
  end

  def previous
    @current_page == 0 ? page_limit : @current_page -= 1  
    list
  end

  def list
    clear_screen
    ticket_range = choose_tickets
    ticket_list = ticket_range.map do |ticket|
      id = ticket["id"]
      subject = ticket["subject"]
      submitter = ticket["submitter_id"]
      created_at = Time.parse(ticket["created_at"])
      date = created_at.strftime("%d %B %Y at %H:%M%p %Z")
      "Ticket id: #{id}, submitted by #{submitter} on #{date} subject '#{subject}'"
    end
    ticket_list.join("\n")
  end

  def show(ticket_id)
    clear_screen
    current_ticket = tickets.find {|ticket| ticket["id"] == ticket_id }
    id = current_ticket["id"]
    subject = current_ticket["subject"]
    submitter = current_ticket["submitter_id"]
    description = current_ticket["description"]
    created_at = Time.parse(current_ticket["created_at"])
    date = created_at.strftime("%d %B %Y at %H:%M%p %Z")
    "Ticket id: #{id}, submitted by #{submitter} on #{date}\nSubject '#{subject}'\n#{description}"
  end

  private
  def page_limit
    puts("No more pages\n")
  end

  def clear_screen
    system "clear" 
  end

  def choose_tickets
    first_ticket = @current_page * OFFSET
    last_ticket = first_ticket + OFFSET
    tickets.slice(first_ticket...last_ticket)
  end
end
