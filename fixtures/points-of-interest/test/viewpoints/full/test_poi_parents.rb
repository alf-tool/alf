require 'test_helper'
module Pois
  describe Privacy, "poi_parents" do
    include ViewpointHelpers

    let(:viewpoint){ full_viewpoint('blambeau') }

    subject{
      query{ poi_parents }
    }

    it 'should include public POIs' do
      subject.restrict(id: "manneken").should_not be_empty
    end

    it 'should include owned POIs' do
      subject.restrict(id: "kites").should_not be_empty
    end

    it 'should not include not owned POIs' do
      subject.restrict(id: "chocolate").should be_empty
    end

  end
end
