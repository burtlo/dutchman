module Dutchman
  module GhostWriter

    class TypingSpeed

      def initialize(name)
        @name = name
      end

      attr_reader :name

      #
      # The value in milliseconds to wait between characters
      #
      def delay_between_characters
        1.0 / available_speeds[name]
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
        (wpm.to_f * 8.0 / 60.0).round(2)
      end
    end

  end
end