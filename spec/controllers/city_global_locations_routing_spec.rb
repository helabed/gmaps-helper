require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CityGlobalLocationsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "city_global_locations", :action => "index").should == "/city_global_locations"
    end
  
    it "should map #new" do
      route_for(:controller => "city_global_locations", :action => "new").should == "/city_global_locations/new"
    end
  
    it "should map #show" do
      route_for(:controller => "city_global_locations", :action => "show", :id => 1).should == "/city_global_locations/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "city_global_locations", :action => "edit", :id => 1).should == "/city_global_locations/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "city_global_locations", :action => "update", :id => 1).should == "/city_global_locations/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "city_global_locations", :action => "destroy", :id => 1).should == "/city_global_locations/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/city_global_locations").should == {:controller => "city_global_locations", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/city_global_locations/new").should == {:controller => "city_global_locations", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/city_global_locations").should == {:controller => "city_global_locations", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/city_global_locations/1").should == {:controller => "city_global_locations", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/city_global_locations/1/edit").should == {:controller => "city_global_locations", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/city_global_locations/1").should == {:controller => "city_global_locations", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/city_global_locations/1").should == {:controller => "city_global_locations", :action => "destroy", :id => "1"}
    end
  end
end
