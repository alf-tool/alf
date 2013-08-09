require 'test_helper'
module MobileCity::Viewpoint
  describe Privacy, "user_profiles" do
    include ViewpointHelpers

    let(:viewpoint){ Privacy[user_id: 'blambeau'] }

    subject{
      query{ user_profiles }
    }

    it 'should only show the profile of the current user' do
      subject.size.should eq(1)
      subject.tuple_extract[:id].should eq('blambeau')
    end

  end
end
