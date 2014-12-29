module Straightedge
  class Engine
    attr_reader :adapter, :surface, :agent
    def initialize(surface_geometry=Straightedge.config.geometry)
      @agent   = Straightedge.new_agent
      @surface = Straightedge.new_surface(surface_geometry)
      @adapter = Straightedge.new_adapter(agent: @agent, plane: @surface)
    end

    def boot
      @adapter.kickstart
    end
  end
end
