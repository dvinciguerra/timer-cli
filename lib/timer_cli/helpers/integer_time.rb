# frozen_string_literal: true

module TimerCli
  module Helpers
    # Integer helpers to time units
    module IntegerTime
      def hours
        self * 3600
      end

      def minutes
        self * 60
      end

      def seconds
        self
      end

      def days
        self * 86_400
      end

      def from_now
        Time.now + self
      end
    end
  end
end

class Integer
  include TimerCli::Helpers::IntegerTime
end
