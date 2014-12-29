module Straightedge
  # a grid with colored marks and a scale
  class Space < Figures::Grid
    attr_accessor :scale

    def at(xy)
      @inner_marks     ||= {}
      @inner_marks[xy] ||= Mark.new(*xy)
      @inner_marks[xy]
    end

    def randomize_colors
      each(&:paint)
      self
    end

    def self.reify_geometry(geometry=[], scale=1.0)
      [geometry.x/scale, geometry.y/scale]
    end

    def reify(xy)
      Grid.reify_geometry(xy, @scale)
    end
  end
end
