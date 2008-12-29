require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/city_global_locations/index.html.erb" do
  include CityGlobalLocationsHelper
  
  before(:each) do
    assigns[:city_global_locations] = [
      stub_model(CityGlobalLocation,
        :country => "value for country",
        :city => "value for city",
        :accent_city => "value for accent_city",
        :population => 1,
        :latitude => 9.99,
        :longitude => 9.99
      ),
      stub_model(CityGlobalLocation,
        :country => "value for country",
        :city => "value for city",
        :accent_city => "value for accent_city",
        :population => 1,
        :latitude => 9.99,
        :longitude => 9.99
      )
    ]
  end

  it "should render list of city_global_locations" do
    render "/city_global_locations/index.html.erb"
    response.should have_tag("tr>td", "value for country".to_s, 2)
    response.should have_tag("tr>td", "value for city".to_s, 2)
    response.should have_tag("tr>td", "value for accent_city".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
  end
end

