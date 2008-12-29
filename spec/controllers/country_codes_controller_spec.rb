require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CountryCodesController do

  def mock_country_code(stubs={})
    @mock_country_code ||= mock_model(CountryCode, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all country_codes as @country_codes" do
      CountryCode.should_receive(:find).with(:all).and_return([mock_country_code])
      get :index
      assigns[:country_codes].should == [mock_country_code]
    end

    describe "with mime type of xml" do
  
      it "should render all country_codes as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        CountryCode.should_receive(:find).with(:all).and_return(country_codes = mock("Array of CountryCodes"))
        country_codes.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested country_code as @country_code" do
      CountryCode.should_receive(:find).with("37").and_return(mock_country_code)
      get :show, :id => "37"
      assigns[:country_code].should equal(mock_country_code)
    end
    
    describe "with mime type of xml" do

      it "should render the requested country_code as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        CountryCode.should_receive(:find).with("37").and_return(mock_country_code)
        mock_country_code.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new country_code as @country_code" do
      CountryCode.should_receive(:new).and_return(mock_country_code)
      get :new
      assigns[:country_code].should equal(mock_country_code)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested country_code as @country_code" do
      CountryCode.should_receive(:find).with("37").and_return(mock_country_code)
      get :edit, :id => "37"
      assigns[:country_code].should equal(mock_country_code)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created country_code as @country_code" do
        CountryCode.should_receive(:new).with({'these' => 'params'}).and_return(mock_country_code(:save => true))
        post :create, :country_code => {:these => 'params'}
        assigns(:country_code).should equal(mock_country_code)
      end

      it "should redirect to the created country_code" do
        CountryCode.stub!(:new).and_return(mock_country_code(:save => true))
        post :create, :country_code => {}
        response.should redirect_to(country_code_url(mock_country_code))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved country_code as @country_code" do
        CountryCode.stub!(:new).with({'these' => 'params'}).and_return(mock_country_code(:save => false))
        post :create, :country_code => {:these => 'params'}
        assigns(:country_code).should equal(mock_country_code)
      end

      it "should re-render the 'new' template" do
        CountryCode.stub!(:new).and_return(mock_country_code(:save => false))
        post :create, :country_code => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested country_code" do
        CountryCode.should_receive(:find).with("37").and_return(mock_country_code)
        mock_country_code.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :country_code => {:these => 'params'}
      end

      it "should expose the requested country_code as @country_code" do
        CountryCode.stub!(:find).and_return(mock_country_code(:update_attributes => true))
        put :update, :id => "1"
        assigns(:country_code).should equal(mock_country_code)
      end

      it "should redirect to the country_code" do
        CountryCode.stub!(:find).and_return(mock_country_code(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(country_code_url(mock_country_code))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested country_code" do
        CountryCode.should_receive(:find).with("37").and_return(mock_country_code)
        mock_country_code.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :country_code => {:these => 'params'}
      end

      it "should expose the country_code as @country_code" do
        CountryCode.stub!(:find).and_return(mock_country_code(:update_attributes => false))
        put :update, :id => "1"
        assigns(:country_code).should equal(mock_country_code)
      end

      it "should re-render the 'edit' template" do
        CountryCode.stub!(:find).and_return(mock_country_code(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested country_code" do
      CountryCode.should_receive(:find).with("37").and_return(mock_country_code)
      mock_country_code.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the country_codes list" do
      CountryCode.stub!(:find).and_return(mock_country_code(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(country_codes_url)
    end

  end

end
