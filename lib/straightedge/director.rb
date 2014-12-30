module Straightedge
  class Director
    extend Forwardable
    include Straightedge::Figures

    def prepare_stage(geometry)
      @width, @height = *geometry
      @space = QuadSpace.new([30,30], scale: 10.0)
      @space.paint!
    end

    def orchestrate
      @space.paint!
    end

    def current_scene
      Scene.new({
	ORIGIN    => @space,
	[10,10]   => "grid",

	[200,300] => Quadrilateral.new(dimensions: [200,100], color: :green),
	[200,305] => "rectangle",

	[400,300] => Hexagon.new(scale: 40.0, color: :blue),
	[400,305] => "hexagon"
      })
    end

    ## handle custom events from the surface (clicks)...
    #  how should we handle socket/player connects?
    #
    def handle(evt_name, *args)
      #puts "--- got event #{evt_name} with args #{args}"
      send(evt_name.to_sym, *args)
    end
  end

  config.agent_class = Director
end
