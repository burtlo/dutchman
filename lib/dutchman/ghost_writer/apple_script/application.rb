module Dutchman
  module GhostWriter
    class AppleScript

      class Application
        def initialize(container,name)
          @container = container
          @name = name
        end

        attr_reader :name, :command

        attr_reader :container

        def command(new_command = nil)
          if new_command
            @command = new_command
          else
            @command
          end
        end

        def keystroke(key_name)
          command [ apl_keystroke(key_name) ]
        end

        def typed_phrase(phrase,delay)
          command phrase.chars.map {|letter| [ apl_keystroke(letter), apl_delay(delay) ] }.flatten
        end

        def applescript
          tell_application_command
        end

        def execute
          container.execute(applescript)
        end

        private

        def tell_application_command
          ERB.new(tell_application_command_template,nil,erb_trim_mode).result(binding)
        end

        def erb_trim_mode
          "-"
        end

        def tell_application_command_template
          template_with_name "tell_application"
        end

        def template_with_name(name)
          File.read(File.join(File.dirname(__FILE__),"#{name}.erb"))
        end

        # AppleScript Commands

        def apl_keystroke(name)
          if name == "\n"
            "keystroke return"
          else
            "keystroke \"#{name}\""
          end
        end

        def apl_delay(amount)
          "delay #{amount}"
        end

      end

    end
  end
end