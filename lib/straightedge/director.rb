module Straightedge
  class Director < Designer
    attr_reader :scenes

    #def initialize(scenes=[])
    #  @scenes = scenes
    #end

    # interface to render -- expects an immutable structure with
    # 			     the rendering locations and elements
    def current_scene
      raise 'implement in subclass'
    end

    def orchestrate
      raise 'implement in a subclass'
    end
  end
end
