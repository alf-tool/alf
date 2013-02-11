require 'commons'

path = (Path.dir/'suppliers-and-parts.db')
path.unlink
sequel_db = ::Sequel.connect("sqlite://#{path}")
sequel_db.tap do |db|
  db.create_table(:suppliers) do
    String  :sid
    String  :name
    Integer :status
    String  :city
    primary_key [:sid]
    index :name, :unique => true
  end
  db.create_table(:parts) do
    String :pid
    String :name
    String :color
    Float  :weight
    String :city
    primary_key [:pid]
  end
  db.create_table(:supplies) do
    foreign_key :sid, :suppliers, :null=>false, :key=>[:sid], :deferrable=>true
    foreign_key :pid, :parts,     :null=>false, :key=>[:pid], :deferrable=>true
    Integer :qty
    primary_key [:sid, :pid]
  end
  db.create_table(:cities) do
    String :city
    String :country
    primary_key [:city]
  end
end

Alf.connect(sequel_db) do |alf_db|
  Alf.connect(Path.dir/'suppliers-and-parts') do |ex|
    alf_db.relvar(:suppliers).affect ex.query{ suppliers }
    alf_db.relvar(:parts).affect ex.query{ parts }
    alf_db.relvar(:supplies).affect ex.query{ supplies }
    alf_db.relvar(:cities).affect ex.query{ cities }
  end
end
