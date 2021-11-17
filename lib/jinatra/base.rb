# frozen_string_literal: true

# Empty module
module Jinatra; end

# Jinatra:Methods is a module to hold
# the methods available in Jinatra
module Jinatra
  # Jinatra:Methods is a module to hold
  # the methods available in Jinatra
  module Methods
    %i[get post head put].each do |http_method|
      define_method(http_method) do |spec, &block|
        @routes ||= []
        @routes.push(
          {
            spec: spec,
            method: http_method,
            handler: block
          }
        )
      end
    end

    def call(env)
      method = env['REQUEST_METHOD'].downcase.to_sym
      @routes.each do |entry|
        next if method != entry[:method]

        if env['PATH_INFO'][entry[:spec]]
          return [200, { 'Content-Type' => 'text/html' },
                  [entry[:handler].call(env)]]
        end
      end
      [404, {}, ['Route not found']]
    end
  end
end

# Simple Jinatra App class
module Jinatra
  class App
    extend Jinatra::Methods
  end
end
