require 'test_helper'
module MobileCity::Viewpoint
  describe Ethics, "pois" do
    include ViewpointHelpers

    subject{
      query{ pois }
    }

    context "when the user is an adult" do
      let(:viewpoint){ Ethics[user_id: 'blambeau'] }

      it 'should not restrict POIs at all' do
        subject.should eq(query{ native.pois })
      end
    end

    context "when the user is a child" do
      let(:viewpoint){ Ethics[user_id: 'mdelsol'] }

      it 'should restrict POIs to non sensible ones only' do
        subject.restrict(sensible: true).should be_empty
      end
    end

  end
end
