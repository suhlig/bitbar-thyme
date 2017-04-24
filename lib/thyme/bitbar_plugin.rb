# frozen_string_literal: true

require 'thyme/status_file'

module Thyme
  #
  # Write the Thyme status to a file
  #
  class BitbarPlugin
    # `config` is an instance of Thyme::Config (see lib/thyme/config.rb)
    def initialize(config, options={})
      @config = config
      @status_file = Thyme::StatusFile.new
    end

    # code to run when thyme starts up
    def before_all; end

    # code to run when timer starts
    def before; end

    def tick(seconds_left)
      @status_file.write(status, seconds_left, status)
    end

    def after(seconds_left)
      @status_file.write('Idle', seconds_left, status)
    end

    def after_all
      # code to run when thyme program ends
    end

    private

    attr_reader :config

    def status
      config.break ? 'Break' : 'Pomodoro'
    end
  end
end
