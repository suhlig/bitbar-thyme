# frozen_string_literal: true

module Bitbar
  module Thyme
    class StatusPresenter
      attr_reader :status, :previous_status, :total_seconds_left

      def initialize(hash)
        @status = hash[:status]
        @total_seconds_left = hash[:seconds_left]
        @previous_status = hash[:previous_status]
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
          if complete?
            "#{status} after #{previous_duration} of #{previous_status}"
          else
            "#{status} after #{time_elapsed} of #{previous_status}"
          end
        when 'Pomodoro', 'Break'
          "#{status} running for #{time_elapsed}"
        else
          'Unknown'
        end
      end

      def complete?
        total_seconds_left.zero?
      end

      def time_elapsed
        if complete?
          previous_duration
        else
          "#{minutes_elapsed}:#{sprintf('%02d', seconds_elapsed)}"
        end
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
        duration = if complete?
                     total_duration(previous_status)
                   else
                     total_duration(status)
                   end

        duration - total_seconds_left
      end

      def total_duration(st=duration_status)
        case st
        when 'Pomodoro'
          25 * 60
        when 'Break'
          5 * 60
        when 'Idle'
          total_duration(previous_status)
        else
          raise "#{st} has no duration"
        end
      end

      def previous_duration
        total = total_duration(previous_status)
        minutes = total / 60
        seconds = total % 60
        "#{minutes}:#{sprintf('%02d', seconds)}"
      end

      private

      def duration_status
        case status
        when 'Pomodoro', 'Break'
          status
        else
          previous_status
        end
      end
    end
  end
end
