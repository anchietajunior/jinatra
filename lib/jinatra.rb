# frozen_string_literal: true

# Capture Ruby's Main obj in a constant
MAIN = self

require_relative 'jinatra/base'

MAIN.extend Jinatra::Methods
