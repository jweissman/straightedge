module Straightedge
  # note this won't work unless you actually
  #      have concrete presenters ...!!
  #      but we really need to bring this into
  #      straightedge so we can unit-test it and
  #      setup contracts...
  #
  class Adapter
    include Straightedge::Figures
    attr_accessor :reactor
    attr_reader   :plane
    
    def initialize(reactor: Reactor.new, plane: plane)
      @reactor = reactor

      @plane   = plane # Surface.new(self)
    end

    def attach(surface)
      @plane = surface
      @plane.adapter = self
    end

    def render
      @reactor.scene.each do |location, figure|
	presenter = presenter_for figure 
	presenter.at(location).display figure
      end
    end

    # note the ordering is important, since e.g., grid < quad
    def presenter_for(figure)
      klass = if figure.is_a?(Grid)
		GridPresenter
	      elsif figure.is_a?(Quadrilateral)
		QuadrilateralPresenter
	      elsif figure.is_a?(Label)
		TextPresenter
	      else
		raise "no presenter class for #{figure}"
	      end

      klass.new.on(@plane)
    end

    def step
      @reactor.turn
    end

    def click(xy)
      puts "--- clicked at #{xy}"
      @reactor.handle(:click, xy)
    end
  end
end
