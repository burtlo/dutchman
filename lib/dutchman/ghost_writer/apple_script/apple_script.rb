require "ERB"
require_relative "command"
require_relative "application"

module Dutchman
  module GhostWriter

    #
    # The current rb_appscript gem said to beware and not to use in new
    # applications. Instead of digging into that application I thought that it
    # be better to simply create a wrapper class that executes the osascript
    # command on the command line.
    #
    class AppleScript
      def app(name)
        Application.new(self,name)
      end

      def execute(applescript)
        `#{command(applescript)}`
      end

      def command(applescript)
        Command.new(self,applescript)
      end
    end

  end
end