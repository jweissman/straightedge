module Straightedge
  class Engine
    def initialize(surface: surface, scene: nil, agent_class: Director, adapter_class: Adapter)
      @agent_class   = agent_class
      @adapter_class = adapter_class
      @scenel        = scene

      @agent    = agent_class.new

      @adapter  = adapter_class.new(agent: @agent, plane: surface)
    end

    def boot
      @adapter.kickstart
    end
  end
end
