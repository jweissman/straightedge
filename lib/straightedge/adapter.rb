module Straightedge
  # note this won't work unless you actually
  #      have concrete presenters ...!!
  #      but we really need to bring this into
  #      straightedge so we can unit-test it and
  #      setup contracts...
  #
  #      again really just an abstract adapter to get you
  #      started for now but eventually will be the basis of
  #      contract-tests
  #
  #      ---
  #
  #      the adapter mediates between designer/developer/managers
  #      and the raw behaviors of the interface
  #
  #
  class Adapter
    include Straightedge::Figures

    attr_accessor :agent
    attr_reader   :plane
    
    def initialize(agent: Director.new, plane: nil) #, plane: plane)
      @agent = agent
      adapt(plane) if plane
    end

    def adapt(plane)
      @plane = plane
      @plane.adapter = self
      @agent.prepare_stage([plane.width, plane.height])
    end

    def kickstart
      @plane.display unless @plane.nil?
    end

    def render #(plane)
      scene = @agent.current_scene.is_a?(Hash) ? Scene.new(agent.current_scene) : agent.current_scene
      scene.render(self)
    end

    # note the ordering is important, since e.g., grid < quad
    def presenter_for(figure)
      klass = if figure.is_a?(Grid)
		GridPresenter
	      elsif figure.is_a?(Quadrilateral)
		QuadrilateralPresenter
	      elsif figure.is_a?(Label) || figure.is_a?(String)
		TextPresenter
	      else
		raise "no presenter class for #{figure}"
	      end
      new_presenter = klass.new
      new_presenter.on(@plane) unless @plane.nil?
      new_presenter
    end

    def step
      @agent.orchestrate
    end

    def click(x,y)
      @agent.handle(:click, x, y)
    end
  end

  config.adapter_class = Adapter
end
