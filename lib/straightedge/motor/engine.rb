module Straightedge
  class Engine
    attr_reader :adapter, :surface, :agent, :scene
    def initialize #(scene: nil, agent_class: Director, adapter_class: Adapter)
      @agent_class   = Straightedge.default_agent_class
      @adapter_class = Straightedge.default_adapter_class
      @surface_class = Straightedge.default_surface_class

      @agent   = @agent_class.new
      @surface = @surface_class.new

      @adapter = @adapter_class.new(agent: @agent, plane: @surface)
    end

    def boot
      @adapter.kickstart
    end
  end
end
