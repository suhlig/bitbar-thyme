# frozen_string_literal: true
require 'yaml/store'

module Thyme
  class StatusFile
    def initialize(path=File.expand_path('~/.thyme-bitbar.yml'))
      @store = YAML::Store.new(path)
    end

    def read
      store.transaction(true) do
        thyme = store[:thyme]
        [thyme[:status], thyme[:seconds_left], thyme[:previous_status]]
      end
    end

    def write(status, seconds_left, previous_status=nil)
      thyme = {}
      thyme[:status] = status
      thyme[:seconds_left] = seconds_left
      thyme[:previous_status] = previous_status

      store.transaction do
        store[:thyme] = thyme
      end
    end

    private

    attr_reader :store
  end
end
