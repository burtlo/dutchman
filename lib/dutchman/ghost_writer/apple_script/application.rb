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

        def typed_phrase(phrase,typing_speed)
          command(phrase.chars.map do |letter|
            [ apl_keystroke(letter), apl_delay(typing_speed.delay_between_characters) ]
          end.flatten)
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
          "keystroke #{translate_to_keystroke(name)}"
        end

        def translate_to_keystroke(name)
          keystroke_translations[name]
        end

        #
        # Translate text characters to their counterpart in the world of
        # AppleScript.
        #
        def keystroke_translations
          @keystroke_translations ||= begin
            hash = { "\n" => "return",
              "\\" => "\\\\",
              "\"" => "\\\"" }
            hash.default_proc = proc { |hash,key| hash[key] = "\"#{key}\"" }
            hash
          end
        end

        def apl_delay(amount)
          "delay #{amount}"
        end

      end

    end
  end
end