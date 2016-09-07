# frozen_string_literal: true
require 'thyme/status_file'

module Bitbar
  module Thyme
    class Status
      attr_reader :status, :previous_status, :total_seconds_left

      def initialize(path=File.expand_path('~/.thyme-bitbar.yml'))
        @status, @total_seconds_left, @previous_status = ::Thyme::StatusFile.new(path).read
      end

      def summary
        case status
        when 'Pomodoro'
          "🍅  #{time_left}"
        when 'Break'
          "🍏  #{time_left}"
        else
          status
        end
      end

      def details
        case status
        when 'Idle'
          "#{status} after #{time_left} of #{previous_status}"
        when 'Pomodoro', 'Break'
          "#{status} running for #{time_elapsed}"
        else
          'Unknown'
        end
      end

      def time_elapsed
        "#{minutes_elapsed}:#{sprintf('%02d', seconds_elapsed)}"
      end

      def minutes_elapsed
        total_seconds_elapsed / 60
      end

      def seconds_elapsed
        total_seconds_elapsed % 60
      end

      def time_left
        "#{minutes_left}:#{sprintf('%02d', seconds_left)}"
      end

      def seconds_left
        total_seconds_left % 60
      end

      def minutes_left
        total_seconds_left / 60
      end

      def total_seconds_elapsed
        total_duration - total_seconds_left
      end

      def total_duration
        case status
        when 'Pomodoro'
          25 * 60
        when 'Break'
          5 * 60
        else
          0
        end
      end
    end
  end
end
