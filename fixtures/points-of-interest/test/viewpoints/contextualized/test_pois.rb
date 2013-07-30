require 'test_helper'
module Pois
  describe Contextualized, "pois" do
    include ViewpointHelpers

    let(:viewpoint){ build_viewpoint(Contextualized, 'blambeau') }

    subject{
      query{ pois }
    }

    it 'should inline descriptions in user language' do
      subject.restrict(id: "brussels").tuple_extract[:description].should eq("Bruxelles")
    end

  end
end
