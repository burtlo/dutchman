require "dutchman/version"
require "dutchman/application"

module Dutchman

  def self.write(params)
    to = params.delete(:to)
    text = params.delete(:text)
    speed = params.delete(:speed) || default_speed

    _write(to,text,speed)
  end

  def self.default_speed
    :moderate
  end

  def self.application(name)
    Application.new(name: name)
  end


  def self._write(to,text,speed)
    # TODO: send the command to applescript
  end


end
