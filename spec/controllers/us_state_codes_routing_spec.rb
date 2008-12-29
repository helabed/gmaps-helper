require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsStateCodesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "us_state_codes", :action => "index").should == "/us_state_codes"
    end
  
    it "should map #new" do
      route_for(:controller => "us_state_codes", :action => "new").should == "/us_state_codes/new"
    end
  
    it "should map #show" do
      route_for(:controller => "us_state_codes", :action => "show", :id => 1).should == "/us_state_codes/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "us_state_codes", :action => "edit", :id => 1).should == "/us_state_codes/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "us_state_codes", :action => "update", :id => 1).should == "/us_state_codes/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "us_state_codes", :action => "destroy", :id => 1).should == "/us_state_codes/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/us_state_codes").should == {:controller => "us_state_codes", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/us_state_codes/new").should == {:controller => "us_state_codes", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/us_state_codes").should == {:controller => "us_state_codes", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/us_state_codes/1").should == {:controller => "us_state_codes", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/us_state_codes/1/edit").should == {:controller => "us_state_codes", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/us_state_codes/1").should == {:controller => "us_state_codes", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/us_state_codes/1").should == {:controller => "us_state_codes", :action => "destroy", :id => "1"}
    end
  end
end
