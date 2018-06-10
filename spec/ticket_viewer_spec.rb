require 'ticket_viewer'

describe 'ticket_viewer' do
  let(:tickets) { [{
      "id"=>2,
      "created_at"=>"2018-06-08T04:45:31Z",
      "subject"=>"velit eiusmod reprehenderit officia cupidatat",
      "description"=>
      "Aute ex sunt culpa ex ea esse sint cupidatat aliqua ex consequat sit reprehenderit. Velit labore proident quis culpa ad duis adipisicing laboris voluptate velit incididunt minim consequat nulla. Laboris adipisicing reprehenderit minim tempor officia ullamco occaecat ut laborum.\n\nAliquip velit adipisicing exercitation irure aliqua qui. Commodo eu laborum cillum nostrud eu. Mollit duis qui non ea deserunt est est et officia ut excepteur Lorem pariatur deserunt.",
      "status"=>"open",
      "submitter_id"=>365480592291,
      "tags"=>["est", "incididunt", "nisi"],
    },
    {
      "id"=>3,
      "created_at"=>"2018-06-08T04:45:31Z",
      "subject"=>"excepteur laborum ex occaecat Lorem",
      "description"=>
      "Exercitation amet in laborum minim. Nulla et veniam laboris dolore fugiat aliqua et sit mollit. Dolor proident nulla mollit culpa in officia pariatur officia magna eu commodo duis.\n\nAliqua reprehenderit aute qui voluptate dolor deserunt enim aute tempor ad dolor fugiat. Mollit aliquip elit aliqua eiusmod. Ex et anim non exercitation consequat elit dolore excepteur. Aliqua reprehenderit non culpa sit consequat cupidatat elit.",
      "status"=>"open",
      "submitter_id"=>365480592291,
      "tags"=>["amet", "labore", "voluptate"],
    }] 
  }

  it 'should display tickets in a list' do
    ticket_viewer = Ticket_viewer.new(tickets)
    expect(ticket_viewer.list).to eq("Ticket id: 2, Subject 'velit eiusmod reprehenderit officia cupidatat' submitted by 365480592291 on 08 June 2018 at 04:45AM UTC\nTicket id: 3, Subject 'excepteur laborum ex occaecat Lorem' submitted by 365480592291 on 08 June 2018 at 04:45AM UTC")
  end

  it 'should display individual ticket details' do
    ticket_viewer = Ticket_viewer.new(tickets)
    expect(ticket_viewer.show(2)).to eq("Ticket id: 2, submitted by 365480592291 on 08 June 2018 at 04:45AM UTC\nSubject 'velit eiusmod reprehenderit officia cupidatat'\nAute ex sunt culpa ex ea esse sint cupidatat aliqua ex consequat sit reprehenderit. Velit labore proident quis culpa ad duis adipisicing laboris voluptate velit incididunt minim consequat nulla. Laboris adipisicing reprehenderit minim tempor officia ullamco occaecat ut laborum.\n\nAliquip velit adipisicing exercitation irure aliqua qui. Commodo eu laborum cillum nostrud eu. Mollit duis qui non ea deserunt est est et officia ut excepteur Lorem pariatur deserunt.")
  end

  it 'should page through tickets when more than 25 are returned' 
end

