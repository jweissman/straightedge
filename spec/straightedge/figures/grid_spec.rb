require 'spec_helper'

describe Grid do
  context "when given width and height" do
    let(:width)  { 10 }
    let(:height) { 10 }
    subject { Grid.new([width,height]) }
    it 'should reflect given width and height' do 
      expect(subject.width).to eql(width)
      expect(subject.height).to eql(height)
    end
  end

  describe ".elements" do 
    subject { Grid.new([2,2]) }

    it 'should iterate over the grid' do
      expect(subject.to_a).to eql([[0, 0], [0, 1], [1, 0], [1, 1]])
    end
  end

  describe "#first" do
    subject { Grid.new([1,1]) }
    its(:first) { should eql([0,0]) }
  end

  describe "#sample" do
    subject { Grid.new([2,2]) }
    its(:sample) { should be_an Array } # eql([1,1])}
  end
end
