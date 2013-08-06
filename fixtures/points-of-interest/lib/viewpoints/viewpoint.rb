module Pois
  module Viewpoint

    def self.[](user_id)
      Module.new{
        include Alf::Viewpoint

        include Pois::Native
        include Pois::UserInfo.for(user_id)
        include Pois::Privacy
        include Pois::Ethics
        include Pois::Contextualized
        include Pois::Restore
      }
    end

  end
end
