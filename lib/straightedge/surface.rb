module Straightedge
  module Surface
    attr_accessor :adapter
    attr_reader :width, :height

    def setup(geometry, adapter: adapter)
      @width, @height = *geometry
      @adapter = adapter
    end

    def display
      warn 'implement in subclass'
    end
  end

  class AbstractSurface
    include Surface
  end
end
