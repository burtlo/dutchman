# TODO: Figure out platform and load the correct one
require_relative "apple_script/apple_script"
require_relative "typing_speed"

module Dutchman
  module GhostWriter

    #
    # @params params [Hash] the parameters :application, :text, :speed
    #
    def self.write(params)
      params[:speed] = speed(params[:speed],params[:humanize])
      # TODO: Platform Switching Here
      apple_script(params)
    end

    def self.apple_script(params)
      app = AppleScript.new.app(params[:application])
      app.typed_phrase(params[:text],params[:speed])
      puts app.applescript
      app.execute
    end

    def self.speed(value,humanize)
      TypingSpeed.new(value,humanize)
    end
  end
end