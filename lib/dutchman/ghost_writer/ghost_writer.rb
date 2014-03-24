# TODO: Figure out platform and load the correct one
require_relative "apple_script/apple_script"
require_relative "typing_speed"

module Dutchman
  module GhostWriter

    #
    # @params params [Hash] the parameters :application, :text, :speed
    #
    def self.write(params)
      params[:speed] = speed(params[:speed])
      # TODO: Platform Switching Here
      apple_script(params)
    end

    def self.apple_script(params)
      app = AppleScript.new.app(params[:application])
      app.typed_phrase(params[:text],params[:speed].delay_between_characters)
      app.execute
    end

    def self.speed(value)
      TypingSpeed.new(value)
    end

    def self.available_speeds
      { slow: 1.0 / (23.0 * 8 / 60).round(2),
        moderate: 1.0 / (35.0 * 8 / 60).round(2),
        fast: 1.0 / (50.0 * 8 / 60).round(2) }
    end
  end
end