require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/country_codes/index.html.erb" do
  include CountryCodesHelper
  
  before(:each) do
    assigns[:country_codes] = [
      stub_model(CountryCode,
        :code => "value for code",
        :name => "value for name"
      ),
      stub_model(CountryCode,
        :code => "value for code",
        :name => "value for name"
      )
    ]
  end

  it "should render list of country_codes" do
    render "/country_codes/index.html.erb"
    response.should have_tag("tr>td", "value for code".to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end

