namespace :fixtures do

  task :sap do
    require 'alf'
    require 'alf-sequel'
    adapter = Path.dir/"../fixtures/suppliers-and-parts/suppliers-and-parts.db"
    adapter.unlink
    adapter = Alf::Adapter.sequel("sqlite://#{adapter}")
    options = {
      migrations_folder: Path.dir/"../fixtures/suppliers-and-parts/migrations"
    }
    Alf.connect(adapter, options) do |conn|
      conn.migrate!
      conn.relvar(:suppliers).affect([
        {:sid => 'S1', :name => 'Smith', :status => 20, :city => 'London'},
        {:sid => 'S2', :name => 'Jones', :status => 10, :city => 'Paris'},
        {:sid => 'S3', :name => 'Blake', :status => 30, :city => 'Paris'},
        {:sid => 'S4', :name => 'Clark', :status => 20, :city => 'London'},
        {:sid => 'S5', :name => 'Adams', :status => 30, :city => 'Athens'}
      ])
      conn.relvar(:parts).affect([
        {:pid => 'P1', :name => 'Nut',   :color => 'Red',   :weight => 12.0, :city => 'London'},
        {:pid => 'P2', :name => 'Bolt',  :color => 'Green', :weight => 17.0, :city => 'Paris'},
        {:pid => 'P3', :name => 'Screw', :color => 'Blue',  :weight => 17.0, :city => 'Oslo'},
        {:pid => 'P4', :name => 'Screw', :color => 'Red',   :weight => 14.0, :city => 'London'},
        {:pid => 'P5', :name => 'Cam',   :color => 'Blue',  :weight => 12.0, :city => 'Paris'},
        {:pid => 'P6', :name => 'Cog',   :color => 'Red',   :weight => 19.0, :city => 'London'}
      ])
      conn.relvar(:supplies).affect([
        {:sid => 'S1', :pid => 'P1', :qty => 300},
        {:sid => 'S1', :pid => 'P2', :qty => 200},
        {:sid => 'S1', :pid => 'P3', :qty => 400},
        {:sid => 'S1', :pid => 'P4', :qty => 200},
        {:sid => 'S1', :pid => 'P5', :qty => 100},
        {:sid => 'S1', :pid => 'P6', :qty => 100},
        {:sid => 'S2', :pid => 'P1', :qty => 300},
        {:sid => 'S2', :pid => 'P2', :qty => 400},
        {:sid => 'S3', :pid => 'P2', :qty => 200},
        {:sid => 'S4', :pid => 'P2', :qty => 200},
        {:sid => 'S4', :pid => 'P4', :qty => 300},
        {:sid => 'S4', :pid => 'P5', :qty => 400}
      ])
      puts conn.relvar(:supplies).heading
    end
  end

end