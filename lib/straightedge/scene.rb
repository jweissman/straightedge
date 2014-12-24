module Straightedge
  # some boilerplate to bootstrap a rendering engine
  class Scene
    attr_reader :figures

    def initialize(grid: Grid.new, figures: [])
      @grid = grid
      @figures = figures
    end

    #def render(adapter)
    #  #fs   = @grid.clip(@figures)
    #  @figures.each do |figure| 
    #    adapter.draw(figure)
    #  end
    #end
  end
end
