require 'time'

class Ticket_viewer
  OFFSET = 25
  attr_reader :tickets

  def initialize(tickets)
    @tickets = tickets
    @page = 0
  end

  def next
    @page += 1
    list
  end

  def previous
    @page -= 1
    list
  end

  def list
    first = @page * OFFSET
    last = first + OFFSET
    page_tickets = tickets.slice(first...last)
    ticket_list = page_tickets.map do |ticket|
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
    current_ticket = tickets.find {|ticket| ticket["id"] == ticket_id }
    id = current_ticket["id"]
    subject = current_ticket["subject"]
    submitter = current_ticket["submitter_id"]
    description = current_ticket["description"]
    created_at = Time.parse(current_ticket["created_at"])
    date = created_at.strftime("%d %B %Y at %H:%M%p %Z")
    "Ticket id: #{id}, submitted by #{submitter} on #{date}\nSubject '#{subject}'\n#{description}"
  end
end
