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
	figure = Figures::Label.new.says(figure) if figure.is_a?(String)
	figure.location = location
	presenter = adapter.presenter_for(figure)
	presenter.display(figure)
      end
    end
  end
end
