module Pois
  #
  # This viewpoint implements the following visibility requirements:
  #
  # * Sensible POIs shall not be visible if the user is a child
  #
  module Ethics
    include Alf::Viewpoint

    # Restrict sensible POIs if the current user is a child
    def pois
      adult = restrict(current_user, age_group: "adult")
      union(
        restrict(super(), sensible: false),
        matching(super(), project(adult, [])))
    end

  end
end
