require 'spec_helper'
describe Director do
  subject { Director.new }
  let(:adapter) { Adapter.new(agent: subject) }

  it 'should respond to adapter events' do
    expect(subject).to receive(:handle).with(:click, [1,2])
    adapter.click([1,2])
  end
end
