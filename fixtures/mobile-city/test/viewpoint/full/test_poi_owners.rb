require 'test_helper'
module MobileCity
  describe Viewpoint, "poi_owners" do
    include ViewpointHelpers

    let(:viewpoint){ Viewpoint[user_id: 'blambeau'] }

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
