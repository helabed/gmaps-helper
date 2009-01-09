class AddCitiesData < ActiveRecord::Migration
  def self.up
    #CityGlobalLocation.delete_all

    open('./geo-info/world-cities-pop.txt').each do |line|
      line.chomp!
      country,city,accent_city,region,population,lat,long =  line.split( ',' )

      CityGlobalLocation.create( 
          :country     => country, 
          :city        => city, 
          :accent_city => accent_city, 
          :population  => population, 
          :latitude    => lat, 
          :longitude   => long, 
          :region      => region)
    end
  end


  def self.down
    CityGlobalLocation.delete_all
  end
end
