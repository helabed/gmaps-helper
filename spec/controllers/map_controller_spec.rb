require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MapController do

  #Delete these examples and add some real ones
  it "should use MapController" do
    controller.should be_an_instance_of(MapController)
  end


  describe "GET 'locate_city_by_name_and_state'" do
    it "should be successful" do
      get 'locate_city_by_name_and_state', :city => "verona,wi,us"
      response.should be_success
    end
  end

  describe "GET 'locate_nearby_city_by_lat_and_long'" do
    it "should be successful" do
      get 'locate_nearby_city_by_lat_and_long'
      response.should be_success
    end
  end
end
