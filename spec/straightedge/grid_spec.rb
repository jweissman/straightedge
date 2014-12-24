require 'spec_helper'

require 'straightedge/extend/array'
require 'straightedge/mark'
require 'straightedge/rose'

require 'straightedge/compass'
require 'straightedge/figure'
require 'straightedge/grid'

describe Straightedge::Grid do
  it "should have width and height" do
    expect(subject.width).to  eql(Straightedge::Grid::DEFAULT_SIZE)
    expect(subject.height).to eql(Straightedge::Grid::DEFAULT_SIZE)
  end

  it 'should express this geometry as an array called dimensions' do 
    expect(subject.lines).to eql([subject.width, subject.height])
  end

  describe ".elements" do 
    subject { Straightedge::Grid.new([2,2]) }

    it 'should iterate over the grid' do
      expect(subject.marks).to eql([[0, 0], [0, 1], [1, 0], [1, 1]])
    end
  end

  describe "#first" do
    subject { Straightedge::Grid.new }
    its(:first) { should eql([0,0]) }
  end
end
