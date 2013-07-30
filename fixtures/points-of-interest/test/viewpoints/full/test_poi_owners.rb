require 'test_helper'
module Pois
  describe Privacy, "poi_owners" do
    include ViewpointHelpers

    let(:viewpoint){ full_viewpoint('blambeau') }

    subject{
      query{ poi_owners }
    }

    it 'should include owned POIs' do
      subject.restrict(id: "kites").should_not be_empty
    end

    it 'should not include not owned POIs' do
      subject.restrict(id: "chocolate").should be_empty
    end

  end
end
