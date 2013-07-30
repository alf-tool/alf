require 'alf'
require 'path'
require_relative 'viewpoints/native'
require_relative 'viewpoints/user_info'
require_relative 'viewpoints/contextualized'
require_relative 'viewpoints/privacy'
require_relative 'viewpoints/ethics'
require_relative 'viewpoints/restore'
module Pois

  DEFAULT_OPTIONS = {
    viewpoint: Pois::Native,
    migrations_folder: Path.dir/"../migrations"
  }

  def self.database(connspec, options)
    Alf.database(connspec, DEFAULT_OPTIONS.merge(options))
  end

  def self.seeds_database(options = {})
    database(Path.dir/"../seeds/base", options)
  end

  def self.sqlite_database(options = {})
    file = Path.dir/"../points-of-interest.db"
    file.unlink rescue nil
    db = database(file, options)
    db.connect(viewpoint: Pois::Native) do |conn|
      conn.migrate!
      seeds_database.connect do |seeds|
        Native.members.each do |member|
          conn.relvar(member).affect(seeds.query(member))
        end
      end
    end
    db
  end

end
