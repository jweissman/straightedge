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
  include Toolkit
  include Figures

  def self.default_scene
    @scene = Scene.new({
      [0,0]     => Grid.new([10,10]).randomize_colors,
      [100,100] => Quadrilateral.new([20,20]),
      [50,50]   => Label.new.says("this is only a test"),
      [150,90]  => "treat strings like labels"
    })
  end 

  # for configurating things? should just be config so
  # we can switch out different things between envs as
  # needed #, surface_class: Straightedge.default_surface_class)
  def self.default_surface_class
    puts "--- using abstract surface"
    AbstractSurface
  end

  def self.default_engine_class
    Engine
  end

  def self.default_agent_class
    Director
  end

  def self.default_adapter_class
    Adapter
  end

  def self.bootstrap
    Engine.new.boot
  end
end
