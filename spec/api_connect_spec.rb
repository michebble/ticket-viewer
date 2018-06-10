require 'api_connect'

describe 'api_connect' do

  it 'should connect to Zendesk API' do
    api_connect = Api_connect.new
    expect(api_connect.code).to be_truthy
  end

end