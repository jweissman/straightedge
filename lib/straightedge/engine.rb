module Straightedge
  class Engine
    def initialize(director: Director.new, adapter: Adapter.new, reactor: Reactor.new)
      @director = director
      @reactor  = reactor
      @adapter  = adapter

      # bind them together...
      @reactor.director = director
      @adapter.reactor  = reactor
    end

    def boot
      @adapter.plane.show
    end
  end
end
