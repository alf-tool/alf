module Pois
  module Contextualized
    include Alf::Viewpoint

    def poi_descriptions
      matching(super(), context)
    end

    def poi_image_descriptions
      matching(super(), context)
    end

    def pois
      join(super(), project(poi_descriptions, [:id, :description]))
    end

    def poi_images
      join(super(), project(poi_image_descriptions, [:id, :description]))
    end

  protected

    def context
      project(current_user, [:lang, :age_group])
    end

  end
end
