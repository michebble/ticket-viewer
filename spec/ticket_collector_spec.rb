require 'ticket_collector'

describe 'ticket_collector' do
  let(:ticket_collector) { Ticket_collector.new }

  it 'should connect to Zendesk API' do
    expect(ticket_collector.code).to be_truthy
  end

  it 'should request all the tickets for the account' do
    expect(ticket_collector.tickets).to be_a Array
  end

  it 'should handle the API being unavailable'
  # not sure how to stub HTTP requests for testing
end