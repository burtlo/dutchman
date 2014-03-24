module Dutchman
  module GhostWriter
    class AppleScript

      #
      # The Command class executes the provided AppleScript.
      #
      class Command
        def initialize(container,applescript)
          @container = container
          @applescript = applescript
        end

        attr_reader :container

        attr_reader :applescript

        def to_s
          command_line
        end

        def execute
          container.execute(self)
        end

        def command_line
          ERB.new(command_line_template).result(binding)
        end

        def command_line_template
          template_with_name "command_line"
        end

        def template_with_name(name)
          File.read(File.join(File.dirname(__FILE__),"#{name}.erb"))
        end

      end

    end
  end
end