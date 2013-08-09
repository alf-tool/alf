require 'test_helper'
module MobileCity::Viewpoint
  describe Contextualized, "poi_image_descriptions" do
    include ViewpointHelpers

    let(:viewpoint){ Contextualized[user_id: 'blambeau'] }

    subject{
      query{ poi_image_descriptions }
    }

    it 'should include descriptions in the user language' do
      subject.restrict(lang: "fr").should_not be_empty
    end

    it 'should not include descriptions in another language' do
      subject.restrict(lang: "en").should be_empty
    end

    it 'should include descriptions in the user group' do
      subject.restrict(age_group: "adult").should_not be_empty
    end

    it 'should not include descriptions in another group' do
      subject.restrict(age_group: "child").should be_empty
    end

  end
end
