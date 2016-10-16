require_relative "test_helper"

class TestApplication < RubyOnMonorail::Application

end


class RubyOnMonoRailAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApplication.new
  end

  def test_request
    get "/"

    assert last_response.ok?
    assert last_response.body.include?("Hello")
   end

   def test_sum
    assert_equal [1, 2, 3, 4, 5].sum, 15
   end

   def test_multiply
    assert_equal [1, 2, 3, 4, 5].multiply, 120
   end
end


