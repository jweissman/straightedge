module Straightedge
  # a grid with Marks at each point, translated according to a scale
  class Space < Figures::Grid
    attr_accessor :scale

    def at(xy)
      @grid_marks     ||= {}
      @grid_marks[xy] ||= super(xy).to_point 
    end

    def randomize_colors
      map!(&:paint)
      self
    end

    def self.expand_geometry(xy, scale=1.0) #@scale)
      [xy.x * scale, xy.y * scale]
    end

    def self.contract_geometry(geometry, scale=1.0)
      [geometry.x/scale, geometry.y/scale]
    end

    def expand(xy)
      Space.expand_geometry(xy, @scale)
    end

    def contract(xy)
      Space.contract_geometry(xy, @scale)
    end
  end

  class QuadSpace < Space
    def at(xy)
      @cells     ||= {}
      @cells[xy] ||= Figures::Quadrilateral.new(expand(xy))
    end
  end
end
