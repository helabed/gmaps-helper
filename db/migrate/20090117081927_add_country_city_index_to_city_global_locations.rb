class AddCountryCityIndexToCityGlobalLocations < ActiveRecord::Migration
  def self.up
    add_index :city_global_locations, [:country, :city], :name => "country_city_index" 
  end

  def self.down
    remove_index :city_global_locations, [:country, :city], :name => "country_city_index" 
  end
end
