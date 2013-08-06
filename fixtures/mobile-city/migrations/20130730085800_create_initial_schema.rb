Sequel.migration do
  up do
    create_table(:user_profiles) do
      String :id
      String :name
      String :lang
      String :age_group
      primary_key [:id]
    end
    create_table(:pois) do
      String  :id
      String  :name
      Boolean :sensible
      primary_key [:id]
    end
    create_table(:poi_parents) do
      String :id
      String :parent
      foreign_key [:id], :pois, :null=>false, :key=>[:id], :deferrable=>true
      foreign_key [:parent], :pois, :null=>false, :key=>[:id], :deferrable=>true
      primary_key [:id]
    end
    create_table(:poi_owners) do
      String :id
      String :owner
      foreign_key [:id], :pois, :null=>false, :key=>[:id], :deferrable=>true
      foreign_key [:owner], :user_profiles, :null=>false, :key=>[:id], :deferrable=>true
      primary_key [:id]
    end
    create_table(:poi_descriptions) do
      String :id
      String :lang
      String :age_group
      String :description
      primary_key [:id, :lang, :age_group]
      foreign_key [:id], :pois, :null=>false, :key=>[:id], :deferrable=>true
    end
    create_table(:poi_images) do
      String :id
      String :poi
      String :url
      primary_key [:id]
      foreign_key [:poi], :pois, :null=>false, :key=>[:id], :deferrable=>true
    end
    create_table(:poi_image_descriptions) do
      String :id
      String :lang
      String :age_group
      String :description
      primary_key [:id, :lang, :age_group]
      foreign_key [:id], :poi_images, :null=>false, :key=>[:id], :deferrable=>true
    end
  end
end