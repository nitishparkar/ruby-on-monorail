require "erubis"

module RubyOnMonorail
  class Controller
    attr_reader :env, :monorail

    def initialize(env)
      @env = env
      @monorail = {
        version: RubyOnMonorail::VERSION,
        started_at: Time.now
      }
    end

    def render(view_name, locals = {})
      filename = File.join("app", "views", controller_name, "#{view_name}.html.erb")
      template = File.read(filename)
      erubis = Erubis::Eruby.new(template)
      erubis.result(locals.merge(env: env, monorail: monorail))
    end

    def controller_name
      klass = self.class.to_s
      klass.gsub! /Controller/, ""
      RubyOnMonorail.to_underscore(klass)
    end
  end
end
