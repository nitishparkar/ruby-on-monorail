require "ruby_on_monorail/version"
require "ruby_on_monorail/array"

module RubyOnMonorail
  class Application
    def call(env)
      [200, {'Content-Type' => 'text/html'},
        ["Hello from RubyOnMonorail!"]]
    end
  end
end
