require 'api_connect'

describe 'api_connect' do
  let(:api_connect) { Api_connect.new }

  it 'should connect to Zendesk API' do
    expect(api_connect.code).to be_truthy
  end

  it 'should request all the tickets for the account' do
    expect(api_connect.tickets).to be_a Array
  end
end