require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CountryCodesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "country_codes", :action => "index").should == "/country_codes"
    end
  
    it "should map #new" do
      route_for(:controller => "country_codes", :action => "new").should == "/country_codes/new"
    end
  
    it "should map #show" do
      route_for(:controller => "country_codes", :action => "show", :id => 1).should == "/country_codes/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "country_codes", :action => "edit", :id => 1).should == "/country_codes/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "country_codes", :action => "update", :id => 1).should == "/country_codes/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "country_codes", :action => "destroy", :id => 1).should == "/country_codes/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/country_codes").should == {:controller => "country_codes", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/country_codes/new").should == {:controller => "country_codes", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/country_codes").should == {:controller => "country_codes", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/country_codes/1").should == {:controller => "country_codes", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/country_codes/1/edit").should == {:controller => "country_codes", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/country_codes/1").should == {:controller => "country_codes", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/country_codes/1").should == {:controller => "country_codes", :action => "destroy", :id => "1"}
    end
  end
end
