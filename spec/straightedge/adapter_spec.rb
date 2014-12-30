require 'spec_helper'

class GridPresenter; end
Straightedge.config.presenter_classes = { Grid => GridPresenter }

describe Adapter do
  let(:director) { Director.new }
  subject { Adapter.new(agent: director) }

  it 'should find presenters' do
    expect(subject.presenter_for(Grid.new)).to be_a(GridPresenter)
    expect(subject.presenter_for(Space.new)).to be_a(GridPresenter)
  end
end
