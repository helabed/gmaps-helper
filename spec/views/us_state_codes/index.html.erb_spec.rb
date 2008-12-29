require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/us_state_codes/index.html.erb" do
  include UsStateCodesHelper
  
  before(:each) do
    assigns[:us_state_codes] = [
      stub_model(UsStateCode,
        :code => "value for code",
        :name => "value for name"
      ),
      stub_model(UsStateCode,
        :code => "value for code",
        :name => "value for name"
      )
    ]
  end

  it "should render list of us_state_codes" do
    render "/us_state_codes/index.html.erb"
    response.should have_tag("tr>td", "value for code".to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end

