require 'net/http'

class MapController < ApplicationController

  QUERY_SERVER = "www.mapmap.org"
  QUERY_CONTROLLER = "/googlemaps"
  QUERY_ACTION = "/city-ws-proxy.jsp"
  
  def locate_city_by_name_and_state
    @city = params[:city]
    query_parts = QUERY_CONTROLLER + QUERY_ACTION + '?city=' + @city
    response = Net::HTTP.get_response( QUERY_SERVER, query_parts )
    response.code       # => "200"
    response.body.size  # => 21835
    @results = response.body[0,response.body.size]
    @results.strip!
    
    respond_to do |format|
      format.xml  { render  :layout => false , 
                            :xml => @results }
    end
  end

  def locate_nearby_city_by_lat_and_long

  end
  
  def initialize
    super
  end
  
  def hello
  end
  
  def goodbye
  end

end
