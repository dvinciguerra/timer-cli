# frozen_string_literal: true

require 'timer_cli/version'
require 'timer_cli/helpers/integer_time'
require 'timer_cli/command'

# TimerCli module
module TimerCli
  # Generic error class
  class Error < StandardError; end

  # globals
  $timer_cli_terminate = false # :RuboCop: Naming/GlobalVars

  # trap signals
  trap('SIGINT') do
    $timer_cli_terminate = true
    puts "\n[timer canceled] Terminating #{Time.now.strftime('%H:%M:%S')}..."
  end

  trap('SIGTERM') do
    $timer_cli_terminate = true
    puts "\n[timer canceled] Terminating #{Time.now.strftime('%H:%M:%S')}..."
  end

  class << self
    # execute the command line interface
    def run(_argv)
      command = TimerCli::Command.new
      command.run
    end
  end
end
