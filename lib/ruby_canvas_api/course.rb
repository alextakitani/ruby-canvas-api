module RubyCanvasApi
  class Course < Base
    def self.find(id)
      resp = connection.get("v1/courses/#{id}")
      raise CourseNotFound if resp&.body&.errors&.any?
      resp.body
    end

    def self.activity_stream(id)
      # resp = connection.get("v1/courses/#{id}/analytics/users/39852/activity")
      resp = connection.get("v1/courses/10780/analytics/users/39852/activity")
      # resp = connection.get("v1/courses/10780/analytics/activity")
      #binding.pry
      raise CourseNotFound if resp&.body&.errors&.any?
      resp.body
    end

    def self.bla
      # resp = connection.get("v1/users/39852/courses/10780/assignments")
      # resp = connection.get("v1/courses/10780/analytics/users/30994/assignments")
      resp = connection.get("v1/users/30994/page_views")
      binding.pry
      raise CourseNotFound if resp&.body&.errors&.any?
      resp.body
    end

  end
end
