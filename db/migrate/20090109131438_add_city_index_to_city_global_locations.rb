class AddCityIndexToCityGlobalLocations < ActiveRecord::Migration
  def self.up
    add_index :city_global_locations, :city
  end

  def self.down
    remove_index :city_global_locations, :city
  end
end
