module RubyCanvasApi
  class User < Base
    def self.create(params = {})
      connection.post("v1/accounts/#{RubyCanvasApi.configuration.account_id}/users", params.to_json)
      # {user: {name: 'mimimim', email: 'lalalu@lala.com'}, pseudonym: {unique_id: 'xzsx@gmail.com'}}
    end

    def self.find(id)
      resp = connection.get("v1/users/#{id}")
      raise UserNotFound if resp.body.errors.any?
      resp.body
    end
  end
end
