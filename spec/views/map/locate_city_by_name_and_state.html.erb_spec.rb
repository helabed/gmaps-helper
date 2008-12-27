require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/map/locate_city_by_name_and_state" do
  before(:each) do
    render 'map/locate_city_by_name_and_state'
  end
  
  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/map/locate_city_by_name_and_state])
  end
end
