module Straightedge
  class Reactor
    attr_accessor :director

    def initialize(director: Director.new)
      @director = director
    end

    def scene; @director.scenes.first end
    def turn;  @director.orchestrate end

    def handle(event, *args)
      puts "--- receive event #{event} with args #{args}"
      @director.send(event, *args)
    end
  end
end
