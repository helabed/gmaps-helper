require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/city_global_locations/edit.html.erb" do
  include CityGlobalLocationsHelper
  
  before(:each) do
    assigns[:city_global_location] = @city_global_location = stub_model(CityGlobalLocation,
      :new_record? => false,
      :country => "value for country",
      :city => "value for city",
      :accent_city => "value for accent_city",
      :population => 1,
      :latitude => 9.99,
      :longitude => 9.99
    )
  end

  it "should render edit form" do
    render "/city_global_locations/edit.html.erb"
    
    response.should have_tag("form[action=#{city_global_location_path(@city_global_location)}][method=post]") do
      with_tag('input#city_global_location_country[name=?]', "city_global_location[country]")
      with_tag('input#city_global_location_city[name=?]', "city_global_location[city]")
      with_tag('input#city_global_location_accent_city[name=?]', "city_global_location[accent_city]")
      with_tag('input#city_global_location_population[name=?]', "city_global_location[population]")
      with_tag('input#city_global_location_latitude[name=?]', "city_global_location[latitude]")
      with_tag('input#city_global_location_longitude[name=?]', "city_global_location[longitude]")
    end
  end
end


