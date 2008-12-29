require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/city_global_locations/show.html.erb" do
  include CityGlobalLocationsHelper
  before(:each) do
    assigns[:city_global_location] = @city_global_location = stub_model(CityGlobalLocation,
      :country => "value for country",
      :city => "value for city",
      :accent_city => "value for accent_city",
      :population => 1,
      :latitude => 9.99,
      :longitude => 9.99
    )
  end

  it "should render attributes in <p>" do
    render "/city_global_locations/show.html.erb"
    response.should have_text(/value\ for\ country/)
    response.should have_text(/value\ for\ city/)
    response.should have_text(/value\ for\ accent_city/)
    response.should have_text(/1/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
  end
end

