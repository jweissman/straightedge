require 'spec_helper'

describe Straightedge::Figure do
  it 'should compute adjacent positions' do
    expect([[0,0]].adjacent).to eql([[0, -1], [0, 1], [1, 0], [-1, 0], [1, -1], [1, 1], [-1, -1], [-1, 1]]) #[0,1])
  end

  it 'should compute centroid' do
    expect([[0,0],[2,2]].center).to eql([1,1])
  end
end
