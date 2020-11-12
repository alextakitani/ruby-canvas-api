RSpec.describe RubyCanvasApi::User do
  it "connects to the api" do
    expect(described_class.connection.class).to eq(Faraday::Connection)
  end

  it "find the user by id" do
    user = described_class.find(30994)
    expect(user).to be_truthy
    require 'awesome_print'
    ap user
  end

  xit "lists the user activity stream" do
    expect(described_class.activity_stream(37583)).to be_truthy
  end
end
