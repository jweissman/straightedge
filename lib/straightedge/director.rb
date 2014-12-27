module Straightedge
  class Director
    extend Forwardable
    include Straightedge::Figures

    attr_accessor :scene

    def prepare_stage(geometry)
      @width, @height = *geometry
    end

    def orchestrate
      warn 'implement in subclass'
    end

    def current_scene
      @scene || Straightedge.default_scene
    end

    ## handle custom events from the surface (clicks)...
    def handle(evt_name, *args)
      puts "--- got event #{evt_name} with args #{args}"
    end
  end
end
