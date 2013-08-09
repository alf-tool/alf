require 'mobile_city'

module ViewpointHelpers

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