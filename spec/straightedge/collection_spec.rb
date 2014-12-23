require 'spec_helper'
require 'straightedge/extend/array'
require 'straightedge/compass'
require 'straightedge/rose'
require 'straightedge/ruler'
require 'straightedge/collection'

describe Straightedge::Collection do
  it 'should compute adjacent positions' do
    expect([[0,0]].adjacent).to eql([[0, -1], [0, 1], [1, 0], [-1, 0], [1, -1], [1, 1], [-1, -1], [-1, 1]]) #[0,1])
  end

  it 'should compute centroid' do
    expect([[0,0],[2,2]].center).to eql([1,1])
  end
end
