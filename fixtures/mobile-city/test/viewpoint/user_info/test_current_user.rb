require 'test_helper'
module MobileCity::Viewpoint
  describe UserInfo, "current_user" do
    include ViewpointHelpers

    let(:viewpoint){ UserInfo[user_id: 'blambeau'] }

    subject{
      query{ current_user }
    }

    it 'should only show the profile of the current user' do
      subject.size.should eq(1)
      subject.tuple_extract[:id].should eq('blambeau')
    end

  end
end
