module MobileCity
  module Viewpoint
    #
    # This viewpoint inlines the descriptions in `pois` and `poi_images`
    # according to the current context as defined by `[:lang, :age_group]` of
    # the current user.
    #
    # NOTE: `poi_descriptions` and `poi_image_descriptions` are restricted
    # according to the context as well but do not abstract from it (no
    # projection of the context attributes).
    #
    # This viewpoint expects to be composed with at least Native (i.e. `pois`,
    # `poi_descriptions`, `poi_images`, `poi_image_descriptions`) and UserInfo
    # (i.e. `current_user`).
    #
    module Contextualized
      include Alf::Viewpoint
      expects Native, UserInfo

      def pois
        join(super, project(poi_descriptions, [:id, :description]))
      end

      def poi_descriptions
        matching(super, context)
      end

      def poi_images
        join(super, project(poi_image_descriptions, [:id, :description]))
      end

      def poi_image_descriptions
        matching(super, context)
      end

    protected

      def context
        project(current_user, [:lang, :age_group])
      end

    end # module Contextualized
  end # module Viewpoint
end # module MobileCity
