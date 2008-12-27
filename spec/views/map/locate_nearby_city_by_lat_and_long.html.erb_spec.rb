require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/map/locate_nearby_city_by_lat_and_long" do
  before(:each) do
    render 'map/locate_nearby_city_by_lat_and_long'
  end
  
  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/map/locate_nearby_city_by_lat_and_long])
  end
end
