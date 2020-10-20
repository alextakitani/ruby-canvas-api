RSpec.describe RubyCanvasApi::User do
  it "connects to the api" do
    expect(described_class.connection.class).to eq(Faraday::Connection)
  end

  it "find the user by id" do
    expect(described_class.find(37583)).to be_truthy
  end

  it "lists the user activity stream" do
    expect(described_class.activity_stream(37583)).to be_truthy
  end
end
