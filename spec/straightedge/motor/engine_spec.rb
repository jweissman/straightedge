require 'spec_helper'

describe Engine do
  subject { Engine.new(surface: plane, agent_class: Director) }
  let(:plane) { double(width: 1, height: 1) }

  it 'should render the surface' do
    expect(plane).to receive(:adapter=).with(kind_of(Adapter))
    expect(plane).to receive(:display) #.with(plane)
    subject.boot
  end
end
