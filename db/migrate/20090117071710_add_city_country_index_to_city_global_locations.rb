class AddCityCountryIndexToCityGlobalLocations < ActiveRecord::Migration
  def self.up
    add_index :city_global_locations, [:city, :country], :name => "city_country_index" 
  end

  def self.down
    remove_index :city_global_locations, [:city, :country], :name => "city_country_index" 
  end
end
