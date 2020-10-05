require 'faraday_middleware'
module RubyCanvasApi
  module Connection
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def connection
        Faraday.new(url: RubyCanvasApi.configuration.api_url, headers: {'Content-Type' => 'application/json'}) do |conn|
          conn.authorization :Bearer, RubyCanvasApi.configuration.token
          conn.response :json, content_type: /\bjson$/, parser_options: {object_class: OpenStruct}
        end
      end
    end
  end
end
