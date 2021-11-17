# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'jinatra'
  spec.version = '0.0.1'
  spec.authors = ['José Anchieta']
  spec.summary = 'A pretty simple web framework based on Sinatra'
  spec.license = 'MIT'
  spec.files = Dir['**/*.rb']
  spec.required_ruby_version = '>= 3.0.2'
  spec.add_runtime_dependency('rack')
end
