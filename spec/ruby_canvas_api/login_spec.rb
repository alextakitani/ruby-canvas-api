RSpec.describe RubyCanvasApi::Login do
  it "connects to the api" do
    expect(described_class.connection.class).to eq(Faraday::Connection)
  end

  it "list the user's logins" do
    expect(described_class.find_by_user(1)).to be_a Array
    expect(described_class.find_by_user(1).first).to have_attributes(user_id: 1, account_id: 1)
  end
end
