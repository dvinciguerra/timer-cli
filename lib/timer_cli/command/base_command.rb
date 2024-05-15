# frozen_string_literal: true

module TimerCli
  class Command
    # base timer command execution class
    class BaseCommand
      def self.execute(params)
        new.execute(params)
      end

      def execute(params)
        @params = params
      end

      private

      attr_reader :params
    end
  end
end
