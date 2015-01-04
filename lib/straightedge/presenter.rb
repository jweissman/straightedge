module Straightedge
  class Presenter
    extend Forwardable

    def on(surface)
      @surface = surface
      self
    end

    def display(figure)
      raise 'implement in subclass'
    end
  end
end
