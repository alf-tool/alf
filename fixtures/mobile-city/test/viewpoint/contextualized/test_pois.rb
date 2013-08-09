require 'test_helper'
module MobileCity::Viewpoint
  describe Contextualized, "pois" do
    include ViewpointHelpers

    let(:viewpoint){ Contextualized[user_id: 'blambeau'] }

    subject{
      query{ pois }
    }

    it 'should inline descriptions in user language' do
      subject.restrict(id: "brussels").tuple_extract[:description].should eq("Bruxelles")
    end

  end
end
