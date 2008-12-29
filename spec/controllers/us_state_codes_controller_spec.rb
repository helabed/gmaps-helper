require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsStateCodesController do

  def mock_us_state_code(stubs={})
    @mock_us_state_code ||= mock_model(UsStateCode, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all us_state_codes as @us_state_codes" do
      UsStateCode.should_receive(:find).with(:all).and_return([mock_us_state_code])
      get :index
      assigns[:us_state_codes].should == [mock_us_state_code]
    end

    describe "with mime type of xml" do
  
      it "should render all us_state_codes as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        UsStateCode.should_receive(:find).with(:all).and_return(us_state_codes = mock("Array of UsStateCodes"))
        us_state_codes.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested us_state_code as @us_state_code" do
      UsStateCode.should_receive(:find).with("37").and_return(mock_us_state_code)
      get :show, :id => "37"
      assigns[:us_state_code].should equal(mock_us_state_code)
    end
    
    describe "with mime type of xml" do

      it "should render the requested us_state_code as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        UsStateCode.should_receive(:find).with("37").and_return(mock_us_state_code)
        mock_us_state_code.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new us_state_code as @us_state_code" do
      UsStateCode.should_receive(:new).and_return(mock_us_state_code)
      get :new
      assigns[:us_state_code].should equal(mock_us_state_code)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested us_state_code as @us_state_code" do
      UsStateCode.should_receive(:find).with("37").and_return(mock_us_state_code)
      get :edit, :id => "37"
      assigns[:us_state_code].should equal(mock_us_state_code)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created us_state_code as @us_state_code" do
        UsStateCode.should_receive(:new).with({'these' => 'params'}).and_return(mock_us_state_code(:save => true))
        post :create, :us_state_code => {:these => 'params'}
        assigns(:us_state_code).should equal(mock_us_state_code)
      end

      it "should redirect to the created us_state_code" do
        UsStateCode.stub!(:new).and_return(mock_us_state_code(:save => true))
        post :create, :us_state_code => {}
        response.should redirect_to(us_state_code_url(mock_us_state_code))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved us_state_code as @us_state_code" do
        UsStateCode.stub!(:new).with({'these' => 'params'}).and_return(mock_us_state_code(:save => false))
        post :create, :us_state_code => {:these => 'params'}
        assigns(:us_state_code).should equal(mock_us_state_code)
      end

      it "should re-render the 'new' template" do
        UsStateCode.stub!(:new).and_return(mock_us_state_code(:save => false))
        post :create, :us_state_code => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested us_state_code" do
        UsStateCode.should_receive(:find).with("37").and_return(mock_us_state_code)
        mock_us_state_code.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :us_state_code => {:these => 'params'}
      end

      it "should expose the requested us_state_code as @us_state_code" do
        UsStateCode.stub!(:find).and_return(mock_us_state_code(:update_attributes => true))
        put :update, :id => "1"
        assigns(:us_state_code).should equal(mock_us_state_code)
      end

      it "should redirect to the us_state_code" do
        UsStateCode.stub!(:find).and_return(mock_us_state_code(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(us_state_code_url(mock_us_state_code))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested us_state_code" do
        UsStateCode.should_receive(:find).with("37").and_return(mock_us_state_code)
        mock_us_state_code.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :us_state_code => {:these => 'params'}
      end

      it "should expose the us_state_code as @us_state_code" do
        UsStateCode.stub!(:find).and_return(mock_us_state_code(:update_attributes => false))
        put :update, :id => "1"
        assigns(:us_state_code).should equal(mock_us_state_code)
      end

      it "should re-render the 'edit' template" do
        UsStateCode.stub!(:find).and_return(mock_us_state_code(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested us_state_code" do
      UsStateCode.should_receive(:find).with("37").and_return(mock_us_state_code)
      mock_us_state_code.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the us_state_codes list" do
      UsStateCode.stub!(:find).and_return(mock_us_state_code(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(us_state_codes_url)
    end

  end

end
