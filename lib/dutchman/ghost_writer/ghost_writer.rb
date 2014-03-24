# TODO: Figure out platform and load the correct one
require_relative "apple_script/apple_script"

module Dutchman
  module GhostWriter

    # application, text, speed
    def self.write(params)
      params[:speed] = speed(params[:speed])
      # TODO: Platform Switching Here
      apple_script(params)
    end

    def self.apple_script(params)
      app = AppleScript.new.app(params[:application])
      app.typed_phrase(params[:text],params[:speed])
      puts app.applescript
      app.execute
    end

    def self.speed(value)
      available_speeds[value] || 0.34
    end

    def self.available_speeds
      { slow: 1.0 / (60.0 * 5 / 60).round(2),
        moderate: 1.0 / (100.0 * 5 / 60).round(2),
        fast: 1.0 / (160.0 * 5 / 60).round(2) }
    end
  end
end