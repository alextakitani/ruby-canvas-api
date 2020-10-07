module RubyCanvasApi
  class Login < Base
    def self.create(user_id:, login_id:, password:)
      params = {login: {password: password, unique_id: login_id}, user: {id: user_id}}
      connection.post("/api/v1/accounts/#{RubyCanvasApi.configuration.account_id}/logins", params.to_json)
    end

    def self.find_by_user(user_id)
      resp = connection.get("/api/v1/users/#{user_id}/logins")
      raise ResourceNotFound if resp.status != 200
      resp.body
    end
  end
end
