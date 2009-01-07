class MapController < ApplicationController

  def locate_city_by_name_and_state
    city_state_country = params[:city]
    city_row = nil
    
      # to deal with verona,wi,us
    if city_state_country.count(',') == 2
      city, state, country = city_state_country.split(",")  
      city_row = CityGlobalLocation.find_by_name( :city => city , 
                                                  :region => state, 
                                                  :country => country )
        # to deal with london,uk
    elsif city_state_country.count(',') == 1 
      city, country = city_state_country.split(",")  
      city_row = CityGlobalLocation.find_by_name( :city => city , 
                                                  :country => country )
    end
    
    results = city_row != nil  ? city_row.to_xml  : "" 
    results.strip!
    
    respond_to do |format|
      format.xml  { render  :layout => false , 
                            :xml => results }
    end
  end

  def locate_nearby_city_by_lat_and_long

  end
  
  def locate_city_on_map
    
  end
  
  def initialize
    super
  end
  
  def hello
  
  end
  
  def goodbye

  end

end
