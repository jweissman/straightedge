module Straightedge
  # a grid with Marks at each point, translated according to a scale
  class Space < Figures::Grid
    def at(xy)
      @grid_marks     ||= {}
      @grid_marks[xy] ||= super(xy).to_point 
    end

    #def paint!
    #  map!(&:paint)
    #  self
    #end
  end

  class QuadSpace < Space
    def at(xy)
      @cells     ||= {}
      @cells[xy] ||= Figures::Quadrilateral.new(dimensions: [@scale, @scale], location: to_pixels(xy))
    end

    def paint!
      puts "--- repaint!"
      map!(&:paint)
      self
    end
  end
end
