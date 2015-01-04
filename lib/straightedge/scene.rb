module Straightedge
  # some boilerplate to bootstrap a rendering engine
  class Scene
    attr_reader :locations_and_figures

    def initialize(locations_and_figures={})
      @locations_and_figures = locations_and_figures
    end

    def render(adapter=nil)
      return false unless adapter
      @locations_and_figures.each do |location,f|
	if f.is_a?(Array)
	  f.map do |figure|
	    Scene.render_figure(figure, location,adapter)
	  end
	else
	  Scene.render_figure(f, location,adapter)
	end
      end
    end

    def self.render_figure(figure,location,adapter)
      figure = Figures::Label.new.says(figure) if figure.is_a?(String)
      figure.location = location
      presenter = adapter.presenter_for(figure)
      presenter.display(figure)
    end
  end
end
