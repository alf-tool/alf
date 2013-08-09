require 'test_helper'
module MobileCity
  describe Viewpoint, "poi_image_descriptions" do
    include ViewpointHelpers

    pending{
      let(:viewpoint){ Viewpoint[user_id: 'blambeau'] }

      subject{
        query{ poi_image_descriptions }
      }

      it 'should include public POIs' do
        subject.restrict(id: "manneken-1").should_not be_empty
      end

      it 'should include owned POIs' do
        subject.restrict(id: "kites-1").should_not be_empty
      end

      it 'should not include not owned POIs' do
        subject.restrict(id: "chocolate-1").should be_empty
      end
    }

  end
end
