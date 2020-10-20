module RubyCanvasApi
  class Enrollment < Base
    def self.create(user_id:, course_id:, section_id:, status:)
      params = {enrollment: {user_id: user_id, type: 'StudentEnrollment', enrollment_state: status, course_section_id: section_id}}
      connection.post("/api/v1/courses/#{course_id}/enrollments", params.to_json)
    end
  end
end
