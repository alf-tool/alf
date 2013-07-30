module Pois
  module Native
    include Alf::Viewpoint

    native :user_profiles
    native :pois
    native :poi_owners
    native :poi_parents
    native :poi_descriptions
    native :poi_images
    native :poi_image_descriptions
  end
end
