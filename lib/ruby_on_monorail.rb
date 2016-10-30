require "ruby_on_monorail/version"
require "ruby_on_monorail/routing"
require "ruby_on_monorail/util"
require "ruby_on_monorail/dependencies"

module RubyOnMonorail
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, ["Not found"]]
      end

      if env['PATH_INFO'] == '/'
        return [307, {'Location' => '/quotes/a_quote'}, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      begin
        text = controller.send(act)
      rescue
        return [500, {'Content-Type' => 'text/html'}, ["Something went wrong."]]
      end

      [200, {'Content-Type' => 'text/html'}, [text]]
    end
  end

  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end
  end
end
