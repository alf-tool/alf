module Pois
  #
  # This viewpoint restores all foreign keys given that POIs and user_profiles
  # have been restricted.
  #
  module Restore
    include Alf::Viewpoint

    # Only (id, parent) for visible pois and visible parents
    def poi_parents
      intersect(
        matching(super(), poi_ids),
        matching(super(), poi_ids(:parent)))
    end

    # Only (poi, owner) pairs for visible POIs and visible owners
    def poi_owners
      intersect(
        matching(super(), poi_ids),
        matching(super(), project(rename(user_profiles, id: :owner), [:owner])))
    end

    # Only POI descriptions for visible POIs
    # def poi_descriptions
    #   matching(super(), poi_ids)
    # end

    # Only imges of visible POIs
    def poi_images
      matching(super(), poi_ids(:poi))
    end

    # Only image descriptions of visible images
    # def poi_image_descriptions
    #   matching(super(), project(poi_images, [:id]))
    # end

  protected

    # Utility projection on ids of visible POIs
    def poi_ids(as = nil)
      proj = project(pois, [:id])
      proj = rename(proj, id: as) if as
      proj
    end

  end
end
