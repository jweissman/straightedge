module Straightedge
  module Surface
    attr_accessor :adapter
    attr_reader :width, :height

    def display
      warn 'implement in subclass'
    end
  end

  class AbstractSurface
    include Surface

    def initialize(geometry, adapter: adapter)
      @width, @height = *geometry
      @adapter = adapter
    end
  end

  config.surface_class = AbstractSurface
end
