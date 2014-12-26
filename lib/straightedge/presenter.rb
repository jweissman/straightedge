module Straightedge
  class Presenter
    extend Forwardable
    def_delegators :location, :x, :y

    def on(surface)
      @surface = surface
      self
    end

    def at(p)
      @location = p
      self 
    end

    def display(figure)
      raise 'implement in subclass'
    end

    def location
      @location ||= [0,0]
    end

    def color
      @color ||= 0xEFEFEFEF
    end
  end
end

#class CellRenderer < RectangleRenderer
#  #def coordinates(x,y,w=1,h=1,grid_scale=1.0)
#  #  super(w,h,grid_scale)
#  #end

#  def render(figure)
#    coords = coordinates_with_colors(figure.x, figure.y, figure.width, figure.height, figure.color).flatten
#    @surface.draw_quad(*coords)
#  end
#end

#class TextRenderer < Renderer
#  def render(label) #, color=Gosu::Color::WHITE, font=Biosphere.game.font)
#    font.draw(label.text, label.x, label.y, ZOrder::UI, 1.0, 1.0, label.color) # 0xffffff00)
#  end
#end

#class RendererFactory
#  def initialize(xy)
#    @xy = xy
#  end

#  class << self
#    def figures
#      { 
#        quad: RectangleRenderer, 
#        cell: CellRenderer,
#        label: TextRenderer

#        # line, point, circle?
#      } 
#    end
#  end

#  RendererFactory.figures.each do |figure, renderer|
#    define_method(figure) do |surface, f| #, *args) do
#      renderer.new(surface).inscribe(f)
#    end
#  end
#end
#end
