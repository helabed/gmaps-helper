class CreateCityGlobalLocations < ActiveRecord::Migration
  def self.up
    create_table :city_global_locations do |t|
      t.string :country
      t.string :city
      t.string :accent_city
      t.integer :population
      t.decimal :latitude, :precision => 12, :scale => 9, :default => 0
      t.decimal :longitude, :precision => 12, :scale => 9, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :city_global_locations
  end
end
