module MobileCity
  module Viewpoint
    #
    # This is the Native viewpoint, corresponding to the base schema in the
    # underlying physical database (e.g. SQL).
    #
    module Native
      include Alf::Viewpoint

      native :user_profiles
      native :pois
      native :poi_owners
      native :poi_parents
      native :poi_descriptions
      native :poi_images
      native :poi_image_descriptions
    end # module Native
  end # module Viewpoint
end # module MobileCity
