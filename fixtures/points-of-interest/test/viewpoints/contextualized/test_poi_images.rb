require 'test_helper'
module Pois
  describe Contextualized, "poi_images" do
    include ViewpointHelpers

    let(:viewpoint){ build_viewpoint(Contextualized, 'blambeau') }

    subject{
      query{ poi_images }
    }

    it 'should inline descriptions in user language' do
      subject.restrict(id: "brussels-1").tuple_extract[:description].should eq("On voit ici la ville de Bruxelles, ...")
    end

  end
end
