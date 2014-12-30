module Straightedge
  class Director
    extend Forwardable
    include Straightedge::Figures

    def prepare_stage(geometry)
      @width, @height = *geometry
    end

    def orchestrate
      warn 'implement Director#orchestrate in subclass'
    end

    def current_scene
      Scene.new({
	ORIGIN    => QuadSpace.new([10,10], scale: 5.0).paint!,
	[200,300] => Quadrilateral.new(location: [200,100]),
	[400,300] => Hexagon.new(location: [200,100]),
	[320,250] => Label.new.says("this is only a test"),
	[150,90]  => "treat strings like labels"
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
