RSpec.describe RubyCanvasApi::User do
  it "connects to the api" do
    expect(described_class.connection.class).to eq(Faraday::Connection)
  end
end
