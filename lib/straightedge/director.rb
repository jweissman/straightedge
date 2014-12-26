module Straightedge
  class Director
    attr_reader :scenes

    def initialize(scenes=[])
      @scenes = scenes
    end

    def orchestrate
      raise 'implement in a subclass'
    end
  end
end
