require "dutchman/version"
require "dutchman/application"

module Dutchman

  def self.write(params)
    to = params.delete(:to)
    text = params.delete(:text)
    speed = params.fetch(:speed,default_speed)
    humanize = params.fetch(:humanize,false)

    _write(application: to, text: text, speed: speed, humanize: humanize)
  end

  def self.default_speed
    :moderate
  end

  def self._write(params)
    GhostWriter.write params
  end

end
