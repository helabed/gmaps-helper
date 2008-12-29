require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CityGlobalLocationsController do

  def mock_city_global_location(stubs={})
    @mock_city_global_location ||= mock_model(CityGlobalLocation, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all city_global_locations as @city_global_locations" do
      CityGlobalLocation.should_receive(:find).with(:all).and_return([mock_city_global_location])
      get :index
      assigns[:city_global_locations].should == [mock_city_global_location]
    end

    describe "with mime type of xml" do
  
      it "should render all city_global_locations as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        CityGlobalLocation.should_receive(:find).with(:all).and_return(city_global_locations = mock("Array of CityGlobalLocations"))
        city_global_locations.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested city_global_location as @city_global_location" do
      CityGlobalLocation.should_receive(:find).with("37").and_return(mock_city_global_location)
      get :show, :id => "37"
      assigns[:city_global_location].should equal(mock_city_global_location)
    end
    
    describe "with mime type of xml" do

      it "should render the requested city_global_location as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        CityGlobalLocation.should_receive(:find).with("37").and_return(mock_city_global_location)
        mock_city_global_location.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new city_global_location as @city_global_location" do
      CityGlobalLocation.should_receive(:new).and_return(mock_city_global_location)
      get :new
      assigns[:city_global_location].should equal(mock_city_global_location)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested city_global_location as @city_global_location" do
      CityGlobalLocation.should_receive(:find).with("37").and_return(mock_city_global_location)
      get :edit, :id => "37"
      assigns[:city_global_location].should equal(mock_city_global_location)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created city_global_location as @city_global_location" do
        CityGlobalLocation.should_receive(:new).with({'these' => 'params'}).and_return(mock_city_global_location(:save => true))
        post :create, :city_global_location => {:these => 'params'}
        assigns(:city_global_location).should equal(mock_city_global_location)
      end

      it "should redirect to the created city_global_location" do
        CityGlobalLocation.stub!(:new).and_return(mock_city_global_location(:save => true))
        post :create, :city_global_location => {}
        response.should redirect_to(city_global_location_url(mock_city_global_location))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved city_global_location as @city_global_location" do
        CityGlobalLocation.stub!(:new).with({'these' => 'params'}).and_return(mock_city_global_location(:save => false))
        post :create, :city_global_location => {:these => 'params'}
        assigns(:city_global_location).should equal(mock_city_global_location)
      end

      it "should re-render the 'new' template" do
        CityGlobalLocation.stub!(:new).and_return(mock_city_global_location(:save => false))
        post :create, :city_global_location => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested city_global_location" do
        CityGlobalLocation.should_receive(:find).with("37").and_return(mock_city_global_location)
        mock_city_global_location.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :city_global_location => {:these => 'params'}
      end

      it "should expose the requested city_global_location as @city_global_location" do
        CityGlobalLocation.stub!(:find).and_return(mock_city_global_location(:update_attributes => true))
        put :update, :id => "1"
        assigns(:city_global_location).should equal(mock_city_global_location)
      end

      it "should redirect to the city_global_location" do
        CityGlobalLocation.stub!(:find).and_return(mock_city_global_location(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(city_global_location_url(mock_city_global_location))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested city_global_location" do
        CityGlobalLocation.should_receive(:find).with("37").and_return(mock_city_global_location)
        mock_city_global_location.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :city_global_location => {:these => 'params'}
      end

      it "should expose the city_global_location as @city_global_location" do
        CityGlobalLocation.stub!(:find).and_return(mock_city_global_location(:update_attributes => false))
        put :update, :id => "1"
        assigns(:city_global_location).should equal(mock_city_global_location)
      end

      it "should re-render the 'edit' template" do
        CityGlobalLocation.stub!(:find).and_return(mock_city_global_location(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested city_global_location" do
      CityGlobalLocation.should_receive(:find).with("37").and_return(mock_city_global_location)
      mock_city_global_location.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the city_global_locations list" do
      CityGlobalLocation.stub!(:find).and_return(mock_city_global_location(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(city_global_locations_url)
    end

  end

end
