module Straightedge
  class Director
    extend Forwardable
    include Straightedge::Figures

    def prepare_stage(geometry)
      @width, @height = *geometry
    end

    def orchestrate
      warn 'implement in subclass'
    end

    def current_scene
      Straightedge.default_scene
    end

    ## handle custom events from the surface (clicks)...
    def handle(evt_name, *args)
      puts "--- got event #{evt_name} with args #{args}"
      send(evt_name.to_sym, *args)
    end

    def click(x,y)
      warn 'click! -- implement in subclass of Director'
    end
  end
end
