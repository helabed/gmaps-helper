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
        # to deal with london
    elsif city_state_country.count(',') == 0 
      city = city_state_country  
      city_row = CityGlobalLocation.find_by_name( :city => city  )
    end

    full_country_name = CountryCode.find_country( city_row )
    city_row[:full_country_name] = full_country_name if city_row != nil

    if city_row != nil && city_row[:country] == 'us'
      full_state_name = UsStateCode.find_state( city_row )
      city_row[:full_state_name] = full_state_name   if city_row != nil
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
