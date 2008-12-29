require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/country_codes/show.html.erb" do
  include CountryCodesHelper
  before(:each) do
    assigns[:country_code] = @country_code = stub_model(CountryCode,
      :code => "value for code",
      :name => "value for name"
    )
  end

  it "should render attributes in <p>" do
    render "/country_codes/show.html.erb"
    response.should have_text(/value\ for\ code/)
    response.should have_text(/value\ for\ name/)
  end
end

