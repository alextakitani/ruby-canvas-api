module RubyCanvasApi
  class User < Base
    def self.create(user_id:,	login_id:, integration_id:,	sortable_name:,	full_name:,	email:)
      params = {
        pseudonym: {unique_id: login_id, sis_user_id: user_id, integration_id: integration_id},
        user: {sortable_name: sortable_name, name: full_name},
        communication_channel: {address: email}
      }
      resp = connection.post("v1/accounts/#{RubyCanvasApi.configuration.account_id}/users", params.to_json)
      raise StandardError if resp.status != 200
      resp.body
    end

    def self.find(id)
      resp = connection.get("v1/users/#{id}", {'include[]': 'last_login'})
      jard
      raise UserNotFound if resp&.body&.errors&.any?
      resp.body
    end

    def self.activity_stream(id)
      resp = connection.get("v1/users/#{id}/activity_stream")
      raise NotFound if resp.body.errors && resp.body.errors.any?
      resp.body
    end
  end
end
