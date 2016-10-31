require_relative "test_helper"
require_relative "test_app/config/application"

class RubyOnMonoRailAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/test/index"

    assert last_response.ok?
    assert_equal last_response.body, "Hello!"
  end
end


