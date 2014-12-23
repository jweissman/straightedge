require 'spec_helper'
require 'straightedge/extend/array'
require 'straightedge/ruler'

describe Straightedge::Ruler do
  let(:a) { [0,3] }
  let(:b) { [4,0] }
  it 'should measure distance' do
    expect(Straightedge::Ruler.distance(a,b)).to eql(5.0)
  end
end
