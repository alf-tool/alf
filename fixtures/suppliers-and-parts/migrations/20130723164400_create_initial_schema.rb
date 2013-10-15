Sequel.migration do
  up do
    create_table(:suppliers) do
      String  :sid
      String  :name
      Integer :status
      String  :city
      primary_key [:sid]
      index :name, :unique => true
    end
    create_table(:parts) do
      String :pid
      String :name
      String :color
      Float  :weight
      String :city
      primary_key [:pid]
    end
    create_table(:supplies) do
      String :sid
      String :pid
      Integer :qty
      primary_key [:sid, :pid]
      foreign_key [:sid], :suppliers, :null=>false, :key=>[:sid], :deferrable=>true
      foreign_key [:pid], :parts,     :null=>false, :key=>[:pid], :deferrable=>true
    end
    create_table(:cities) do
      String :city
      String :country
      primary_key [:city]
    end
  end
end