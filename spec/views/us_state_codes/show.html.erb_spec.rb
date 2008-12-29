require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/us_state_codes/show.html.erb" do
  include UsStateCodesHelper
  before(:each) do
    assigns[:us_state_code] = @us_state_code = stub_model(UsStateCode,
      :code => "value for code",
      :name => "value for name"
    )
  end

  it "should render attributes in <p>" do
    render "/us_state_codes/show.html.erb"
    response.should have_text(/value\ for\ code/)
    response.should have_text(/value\ for\ name/)
  end
end

