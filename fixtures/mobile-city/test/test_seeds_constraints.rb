require 'test_helper'
describe 'The constraints on seeds' do

  let(:db){ MobileCity.seeds_database }

  def query(*args, &bl)
    db.connect do |conn|
      conn.query(*args, &bl)
    end
  end

  def is_key!(relvar, attrs)
    all  = query(relvar)
    proj = all.project(attrs)
    all.size.should eq(proj.size)
  end

  context 'pois' do

    it 'has unique id' do
      is_key!(:pois, [:id])
    end
  end

  context 'poi_owners' do

    it 'has unique id' do
      is_key!(:poi_owners, [:id])
    end

    it 'has only valid POIs' do
      query{
        not_matching(poi_owners, project(pois, [:id]))
      }.should be_empty
    end

    it 'has only valid owners' do
      query{
        not_matching(poi_owners, rename(project(user_profiles, [:id]), id: :owner))
      }.should be_empty
    end
  end

  context 'poi_parents' do

    it 'has unique id' do
      is_key!(:poi_parents, [:id])
    end

    it 'has only valid POIs' do
      query{
        not_matching(poi_parents, project(pois, [:id]))
      }.should be_empty
    end

    it 'has only valid parents' do
      query{
        not_matching(poi_parents, rename(project(pois, [:id]), id: :parent))
      }.should be_empty
    end
  end

  context 'poi_descriptions' do

    it 'has unique id' do
      is_key!(:poi_descriptions, [:id, :lang, :age_group])
    end

    it 'has only valid POIs' do
      query{
        not_matching(poi_descriptions, project(pois, [:id]))
      }.should be_empty
    end
  end

  context 'poi_images' do

    it 'has unique id' do
      is_key!(:poi_images, [:id])
    end

    it 'has only valid POIs' do
      query{
        not_matching(poi_images, rename(project(pois, [:id]), id: :poi))
      }.should be_empty
    end
  end

  context 'poi_image_descriptions' do

    it 'has unique id' do
      is_key!(:poi_image_descriptions, [:id, :lang, :age_group])
    end

    it 'has only valid images' do
      query{
        not_matching(poi_image_descriptions, project(poi_images, [:id]))
      }.should be_empty
    end
  end

end
