require 'time'

class Ticket_viewer
  attr_reader :tickets

  def initialize(tickets)
    @tickets = tickets
  end

  def list
    ticket_list = tickets.map do |ticket|
      id = ticket["id"]
      subject = ticket["subject"]
      submitter = ticket["submitter_id"]
      created_at = Time.parse(ticket["created_at"])
      date = created_at.strftime("%d %B %Y at %H:%M%p %Z")
      "Ticket id: #{id}, Subject '#{subject}' submitted by #{submitter} on #{date}"
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
