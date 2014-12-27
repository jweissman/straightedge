module Straightedge
  # some boilerplate to bootstrap a rendering engine
  class Scene
    attr_reader :locations_and_figures

    def initialize(locations_and_figures={})
      @locations_and_figures = locations_and_figures
    end

    def render(adapter=nil)
      return false unless adapter
      @locations_and_figures.each do |location,figure|
	presenter = adapter.presenter_for(figure).at(location)
	presenter.display(figure)
      end
    end
  end
end
