require 'mobile_city'

module ViewpointHelpers

  def build_viewpoint(mod, user_id)
    Module.new{
      include Alf::Viewpoint
      include MobileCity::Viewpoint::Native
      include MobileCity::Viewpoint::UserInfo.for(user_id)
      include mod unless mod==MobileCity::Viewpoint::UserInfo
    }
  end

  def full_viewpoint(user_id)
    Module.new{
      include Alf::Viewpoint
      include MobileCity::Viewpoint::Native
      include MobileCity::Viewpoint::UserInfo.for(user_id)
      include MobileCity::Viewpoint::Privacy
      include MobileCity::Viewpoint::Ethics
      include MobileCity::Viewpoint::Contextualized
      include MobileCity::Viewpoint::Restore
    }
  end

  def database(options = {})
    options = options.merge(viewpoint: viewpoint)
    MobileCity.seeds_database(options)
  end

  def connection(options = {})
    database(options).connection
  end

  def query(&bl)
    connection.query(&bl)
  end

end