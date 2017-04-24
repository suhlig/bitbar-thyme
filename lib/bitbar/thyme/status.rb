# frozen_string_literal: true
require 'thyme/status_file'

module Bitbar
  module Thyme
    class Status
      def initialize
        @status, @seconds_left, @previous_status = ::Thyme::StatusFile.new.read
      end

      def summary
        @status
      end

      def details
        case @status
        when 'Idle'
          "#{@status} after #{@seconds_left} seconds of #{@previous_status}"
        when 'Pomodoro', 'Break'
          "#{@seconds_left} seconds left in this #{@status}"
        else
          'Unknown'
        end
      end
    end
  end
end
