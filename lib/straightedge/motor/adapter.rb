module Straightedge
  class Adapter
    include Straightedge::Figures
    attr_accessor :agent
    attr_reader   :plane
    
    def initialize(agent: Director.new, plane: nil)
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

    def render
      scene = @agent.current_scene.is_a?(Hash) ? Scene.new(agent.current_scene) : agent.current_scene
      scene.render(self)
    end

    # note the ordering is important, since e.g., grid < quad
    def presenter_for(figure)
      figures_and_presenters = Straightedge.config.presenter_classes 
      matched_class = figures_and_presenters.keys.detect { |k| figure.class <= k }

      klass = if matched_class
		figures_and_presenters[matched_class]
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

  config.presenter_classes = {}
  config.adapter_class = Adapter
end
