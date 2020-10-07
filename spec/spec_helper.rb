require "bundler/setup"
require "ruby_canvas_api"
require "ruby_jard"
require 'dotenv'
Dotenv.load
RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:suite) do
    RubyCanvasApi.configure do |c|
      c.token = ENV['TOKEN']
      c.api_url = ENV['API_URL']
      c.account_id = ENV['ACCOUNT_ID']
    end
  end
end
