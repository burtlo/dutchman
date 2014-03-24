module Dutchman
  module GhostWriter

    class TypingSpeed

      def initialize(name,humanize)
        @name = name
        @humanize = humanize
      end

      attr_reader :name

      attr_reader :humanize

      #
      # The value in milliseconds to wait between characters
      #
      def delay_between_characters
       standard_delay = (1.0 / available_speeds[name]).round(2)
       current_delay = standard_delay + variance(standard_delay)
       current_delay.round(2)
      end

      def variance(delay)
        humanize ? random_number_between_pos_and_neg(delay) : 0.0
      end

      def random_number_between_pos_and_neg(number)
        rand(number * 100).to_f / 100 * (rand(2).odd? ? -1 : 1)
      end

      def available_speeds
        @avaliable_speeds ||= begin
          hash = { slow: wpm_to_cps(23.0),
            moderate: wpm_to_cps(35.0),
            fast: wpm_to_cps(50.0) }
          hash.default = hash[:moderate]
          hash
        end
      end

      #
      # The assumption is that each word is 8 characters in length.
      #
      def wpm_to_cps(wpm)
        wpm.to_f * 10.0 / 60.0
      end
    end

  end
end