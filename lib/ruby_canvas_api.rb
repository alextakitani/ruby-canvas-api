require "logger"
require "forwardable"
require "faraday"
require "json"
require "ruby_canvas_api/version"
require "ruby_canvas_api/configuration"
require "ruby_canvas_api/connection"
require "ruby_canvas_api/base"
require "ruby_canvas_api/user"
require "ruby_canvas_api/login"
require "ruby_canvas_api/course"
require "ruby_jard"
module RubyCanvasApi
  class UserNotFound < StandardError; end
  class CourseNotFound < StandardError; end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
