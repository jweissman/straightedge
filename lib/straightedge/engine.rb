module Straightedge
  class Engine
    def initialize(director: Director.new, plane: nil, adapter: Adapter.new, reactor: Reactor.new)
      @director = director
      @reactor  = reactor
      @adapter  = adapter

      # bind them together...
      @reactor.director = director
      @adapter.reactor  = reactor
      @adapter.attach(plane) if plane
    end

    def boot
      @adapter.plane.show
    end
  end
end
