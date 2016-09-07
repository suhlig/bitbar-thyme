# frozen_string_literal: true
require 'thyme/status_file'

module Bitbar
  module Thyme
    class Status
      def initialize
        @status, @total_seconds_left, @previous_status = ::Thyme::StatusFile.new.read
      end

      def summary
        case @status
        when 'Pomodoro'
          "🍅  #{time_left}"
        when 'Break'
          "🍏  #{time_left}"
        else
          @status
        end
      end

      def details
        case @status
        when 'Idle'
          "#{@status} after #{time_left} of #{@previous_status}"
        when 'Pomodoro', 'Break'
          "#{time_left} left in this #{@status}"
        else
          'Unknown'
        end
      end

      def time_left
        "#{minutes_left}:#{'%02d' % seconds_left}"
      end

      def seconds_left
        @total_seconds_left % 60
      end

      def minutes_left
        @total_seconds_left / 60
      end
    end
  end
end
