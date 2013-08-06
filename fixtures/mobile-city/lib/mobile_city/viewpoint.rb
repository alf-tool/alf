require_relative 'viewpoint/native'
require_relative 'viewpoint/user_info'
require_relative 'viewpoint/contextualized'
require_relative 'viewpoint/privacy'
require_relative 'viewpoint/ethics'
require_relative 'viewpoint/restore'
module MobileCity
  module Viewpoint

    def self.[](user_id)
      Module.new{
        include Alf::Viewpoint

        include Native
        include UserInfo.for(user_id)
        include Privacy
        include Ethics
        include Contextualized
        include Restore
      }
    end

  end
end
