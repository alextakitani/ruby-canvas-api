RSpec.describe RubyCanvasApi::Course do
  it "connects to the api" do
    expect(described_class.connection.class).to eq(Faraday::Connection)
  end

  it "find the course by id" do
    expect(described_class.find(10780)).to be_truthy
  end

  it "gets the course activity_stream" do
    #expect(described_class.activity_stream(10780)).to be_truthy
    expect(described_class.bla).to be_truthy
  end


end
