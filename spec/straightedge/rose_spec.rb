require 'spec_helper'
require 'straightedge/extend/array'
require 'straightedge/rose'
require 'straightedge/ruler'

  # TODO separate into own spec?
describe Straightedge::Rose do
  context "roses" do
    it 'should construct a simple rose' do
      %i[ north south east west ].each do |d| 
	expect(Rose.simple.directions.keys).to include(d) 
      end
    end

    it 'should construct an extended rose' do
      expect(Rose.extended.directions).to eql({
	:east  => [1, 0],
	:north => [0, -1],
	:northeast => [1, -1],
	:northwest => [-1, -1],
	:south => [0, 1],
	:southeast => [1, 1],
	:southwest => [-1, 1],
	:west => [-1, 0]
      })
    end
  end 
end
