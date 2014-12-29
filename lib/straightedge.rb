require 'mini/config'

require 'straightedge/version'

require 'straightedge/tools'
require 'straightedge/figures'

require 'straightedge/scene'
require 'straightedge/presenter'

# for integration with gaming engines...
require 'straightedge/motor/engine'
require 'straightedge/director'
require 'straightedge/adapter'
require 'straightedge/surface'

require 'straightedge/colors'

require 'straightedge/extend/array'

module Straightedge
  include Mini::Config

  include Toolkit
  include Figures

  configure do |straightedge|
    straightedge.surface_class  = AbstractSurface
    straightedge.agent_class    = Director
    straightedge.adapter_class  = Adapter
    straightedge.engine_class   = Engine

    straightedge.geometry = [ 1600, 1200 ]

    straightedge.palette = Colors.pleasant_pastels_palette
  end
  
  class << self
    %w[ engine agent surface adapter ].each do |elem|
      define_method("new_#{elem}") { |*args| Straightedge.config.send("#{elem}_class").new(*args) }
    end
  end

  def self.bootstrap
    new_engine.boot
  end
end
