require 'points-of-interest'

module ViewpointHelpers

  def build_viewpoint(mod, user_id)
    Module.new{
      include Alf::Viewpoint
      include Pois::Native
      include Pois::UserInfo.for(user_id)
      include mod unless mod==Pois::UserInfo
    }
  end

  def full_viewpoint(user_id)
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

  def database(options = {})
    options = options.merge(viewpoint: viewpoint)
    Pois.seeds_database(options)
  end

  def connection(options = {})
    database(options).connection
  end

  def query(&bl)
    connection.query(&bl)
  end

end