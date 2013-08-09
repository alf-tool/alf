module MobileCity
  module Viewpoint
    #
    # This viewpoint implements the following visibility requirements:
    #
    # * User profiles shall not be visible by other users than the current one
    # * Private POIs shall only be visible if owned by the current user
    #
    # Those requirements are implemented through restrictions of `user_profiles`
    # and `pois`, respectively. The viewpoint therefore expects to be composed
    # with Native (i.e. `pois`, `user_profiles`) and UserInfo
    # (i.e. `current_user`).
    #
    module Privacy
      include Alf::Viewpoint
      expects Native, UserInfo
      depends :native, Native

      # Restrict visible profiles to the one of the current user
      def user_profiles
        current_user
      end

      # Restrict POIs to those owned by the current user or the public ones
      # (i.e. not owned by anyone)
      def pois
        owned_pois  = matching(super, restrict(native.poi_owners, owner: user_id))
        public_pois = not_matching(super, native.poi_owners)
        union(owned_pois, public_pois)
      end

    end # module Privacy
  end # module Viewpoint
end # module MobileCity
