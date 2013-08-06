require 'alf'
require 'path'
require_relative 'mobile_city/viewpoint'
module MobileCity

  DEFAULT_OPTIONS = {
    viewpoint: Viewpoint::Native,
    migrations_folder: Path.dir/"../migrations"
  }

  def self.database(connspec, options = {})
    Alf.database(connspec, DEFAULT_OPTIONS.merge(options))
  end

  def self.seeds_database(options = {})
    database(Path.dir/"../seeds/base", options)
  end

  def self.sqlite_database(options = {})
    file = Path.dir/"../mobile-city.db"
    file.unlink rescue nil
    db = database(file, options)
    db.connect(viewpoint: Viewpoint::Native) do |conn|
      conn.migrate!
      seeds_database.connect do |seeds|
        Viewpoint::Native.members.each do |member|
          conn.relvar(member).affect(seeds.query(member))
        end
      end
    end
    db
  end

end
