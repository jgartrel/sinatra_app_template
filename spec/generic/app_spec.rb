require_relative '../spec_helper'

describe "My Sinatra Application" do
  it "should allow accessing the home page" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.status).to eq 200
  end
end
