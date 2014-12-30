module Straightedge
  # TODO something with this
  class Presenter
    extend Forwardable
    #def_delegators :location, :x, :y

    def on(surface)
      @surface = surface
      self
    end

    #def at(p)
    #  @location = p
    #  self 
    #end

    def display(figure)
      raise 'implement in subclass'
    end

    #def location
    #  @location ||= [0,0]
    #end

    #def color(figure)
    #  @color ||= 0xEFEFEFEF
    #end
  end
end
