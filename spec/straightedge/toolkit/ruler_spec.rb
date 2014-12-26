require 'spec_helper'

describe Ruler do
  let(:a) { [0,3] }
  let(:b) { [4,0] }

  it 'should have a unit' do
    expect(subject.unit).to eql(1)
  end

  it 'should measure distance' do
    expect(Ruler.distance(a,b)).to eql(5.0)
  end
end
