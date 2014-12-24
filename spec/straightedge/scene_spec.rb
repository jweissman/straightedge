require 'spec_helper'

#require 'straightedge/extend/array'
#require 'straightedge/ruler'
#require 'straightedge/mark'
#require 'straightedge/rose'
#require 'straightedge/compass'
#require 'straightedge/figure'
#require 'straightedge/grid'
#require 'straightedge/scene'

#describe Straightedge::Scene do
#  let(:figures) do 
#    [ Figure.new([[0,0]]) ]
#  end
#
#  let(:grid) do
#    Grid.new([10,10])
#  end
#
#  subject { Scene.new(grid: grid, figures: figures) }
#  it 'should write figures to an adapter' do
#    adapter = double
#    expect(adapter).to receive(:draw).with(figures.first)
#    subject.render(adapter)
#  end
#end
