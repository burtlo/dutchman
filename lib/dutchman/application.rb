require "dutchman/ghost_writer/ghost_writer"

module Dutchman
  class Application
    def initialize(params)
      @name = params.delete(:name)
    end

    attr_reader :name

    def write(text)
      _write(name,text,:moderate)
    end

    private

    def _write(name,text,speed)
      GhostWriter.write(application: name, text: text,speed: speed)
    end
  end
end