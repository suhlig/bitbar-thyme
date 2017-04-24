# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bitbar/thyme'

def fixture(path)
  File.expand_path("fixtures/#{path}", __dir__)
end
