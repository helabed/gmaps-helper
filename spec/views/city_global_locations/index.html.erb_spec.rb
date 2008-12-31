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
    
    # Hani Dec. 31st, 2008
    # To deal with the annoying 'undefined method `total_pages' for #<Array...' exception while running rake,
    # i had to add the following line
    # The problem is that ":city_global_locations" is an instance of Ruby's standard Array class, 
    # whereas will_paginate uses a class called WillPaginate::Collection that imitates the behaviour 
    # of an array, but also includes pagination functionality.
    # You may have to stub out various method calls on that object (total_pages and such) 
    # in order for will_paginate to accept it.
    assigns[:city_global_locations].stub!(:total_pages).and_return(0)
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

