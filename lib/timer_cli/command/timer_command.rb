# frozen_string_literal: true

require 'pastel'
require 'tty-progressbar'

module TimerCli
  class Command
    # timer command execution class
    class TimerCommand < BaseCommand
      def execute(params)
        super

        parse_time_and_unit!

        start_time = Time.now
        finish_time = time.send(unit).from_now

        prepare_clock(start: start_time, finish: finish_time)

        puts "#{[name, timer].join(' ')} - #{start_time.strftime('%H:%M:%S')}"

        (0..clock).each do
          break if $timer_cli_terminate

          sleep(1)
          progressbar.advance unless $timer_cli_terminate
        end

        puts "Timer #{name} finished at #{finish_time}" unless $timer_cli_terminate
      end

      private

      UNIT_PATTERN = /(?<time>\d+)(?<unit>s|m|h)/.freeze

      AVAILABLE_UNITS = {
        's' => 'seconds',
        'm' => 'minutes',
        'h' => 'hours'
      }.freeze

      attr_reader :clock, :time, :unit

      def parse_time_and_unit!
        time, unit = timer.match(UNIT_PATTERN).values_at(:time, :unit)

        @time = time.to_i
        @unit = AVAILABLE_UNITS[unit]
      end

      def timer
        @timer ||= params[:timer]
      end

      def name
        @name ||= params[:name]
      end

      def color
        @color ||= Pastel.new
      end

      def prepare_clock(start:, finish:)
        @clock = finish - start
      end

      def progressbar
        raise TimerCli::Error, 'Timer @clock variable is not set' unless @clock

        @progressbar ||= TTY::ProgressBar.new(
          ':bar :elapsed :percent',
          width: 40,
          bar_format: :block,
          total: @clock,
          complete: primary_color,
          incomplete: secondary_color,
          clear: true
        )
      end

      def primary_color
        color.on_bright_magenta(' ')
      end

      def secondary_color
        color.on_black(' ')
      end
    end
  end
end
