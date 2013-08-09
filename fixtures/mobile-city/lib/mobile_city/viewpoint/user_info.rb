module MobileCity
  module Viewpoint
    #
    # This viewpoint is expected to be build through `UserInfo.for(user_id)`. It
    # installs a `current_user` expression that filters `user_profiles` using
    # the id of the current user received as argument.
    #
    # The viewpoint is expected to be composed with Native (i.e. `user_profiles`)
    #
    module UserInfo
      include Alf::Viewpoint

      depends :native, Native

      # Returns the identifier of the current user
      def user_id
        contextual_params[:user_id]
      end

      # Returns a restriction of `user_profiles` on the current user.
      def current_user
        restrict(native.user_profiles, id: user_id)
      end

    end # module UserInfo
  end # module Viewpoint
end # module MobileCity
