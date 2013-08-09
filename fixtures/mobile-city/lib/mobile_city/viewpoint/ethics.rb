module MobileCity
  module Viewpoint
    #
    # This viewpoint implements the following visibility requirements:
    #
    # * Sensible POIs shall not be visible if the user is a child.
    #
    # This requirement is achieved by restricting `pois` accordingly. The
    # viewpoint therefore expects to be composed with Native (i.e. pois)
    # and UserInfo (i.e. `current_user`).
    #
    module Ethics
      include Alf::Viewpoint
      expects Native, UserInfo

      # Restrict sensible POIs if the current user is a child
      def pois
        adult = restrict(current_user, age_group: "adult")
        union(                                    # both ...
          restrict(super(), sensible: false),     #   1) non sensible POIs
          matching(super(), project(adult, [])))  #   2) and all of them if adult
      end

    end # module Ethics
  end # module Viewpoint
end # module MobileCity
