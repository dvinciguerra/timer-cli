# frozen_string_literal: true

require 'timer_cli/command/base_command'
require 'timer_cli/command/timer_command'

module TimerCli
  class Command
    # timer commands dispatcher
    module Dispatcher
      def dispatch
        parse

        if help?
          print help
        elsif errors?
          puts params.errors.summary
        else
          TimerCli::Command::TimerCommand.execute(params)
        end
      end

      private

      def help?
        params[:help]
      end

      def errors?
        params.errors.any?
      end

      def errors_summary
        puts params.errors.summary
      end
    end
  end
end
