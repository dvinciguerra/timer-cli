# frozen_string_literal: true

require 'tty-option'

require 'timer_cli/command/dispatcher'

module TimerCli
  # TimerCli command line interface
  class Command
    include TTY::Option
    include Dispatcher

    usage do
      program 'timer'
    end

    argument :timer do
      optional
      desc 'execution timer from given time unit (s, m, h)'
      # example 'timer 5m'
    end

    option :name do
      short '-n'
      long '--name string'
      desc 'Define timer name'
      # example 'timer -n "Daily Standup" 10m'
    end

    flag :help do
      short '-h'
      long '--help'
      desc 'Print usage'
    end

    def run
      dispatch
    end
  end
end
