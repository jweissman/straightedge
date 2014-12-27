require 'spec_helper'

describe Engine do
  subject { Engine.new }
  let(:plane) { subject.surface } 

  it 'should render the surface' do
    expect(plane).to receive(:display) #.with(plane)
    subject.boot
  end
end
