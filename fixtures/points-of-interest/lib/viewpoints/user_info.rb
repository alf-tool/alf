module Pois
  #
  # This viewpoint is expected to be build through `UserInfo.for(...)`. It
  # installs a `current_user` expression.
  #
  module UserInfo
    include Alf::Viewpoint

    def self.for(user_id)
      Module.new{
        include Alf::Viewpoint
        include UserInfo
        define_method(:user_id){ user_id }
      }
    end

    namespace :native, Native

    # Returns a restriction of `user_profiles` on the current user.
    def current_user
      restrict(native.user_profiles, id: user_id)
    end

  end
end
