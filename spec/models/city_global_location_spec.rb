require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CityGlobalLocation do
  before(:each) do
    @valid_attributes = {
      :country => "value for country",
      :city => "value for city",
      :accent_city => "value for accent_city",
      :population => 1,
      :latitude => 9.99,
      :longitude => 9.99
    }
  end

  it "should create a new instance given valid attributes" do
    CityGlobalLocation.create!(@valid_attributes)
  end
end
