require_relative 'viewpoint/native'
require_relative 'viewpoint/user_info'
require_relative 'viewpoint/contextualized'
require_relative 'viewpoint/privacy'
require_relative 'viewpoint/ethics'
require_relative 'viewpoint/restore'
module MobileCity
  module Viewpoint
    include Alf::Viewpoint
    expects Native
    expects UserInfo
    expects Privacy
    expects Ethics
    expects Contextualized
    expects Restore

  end
end
