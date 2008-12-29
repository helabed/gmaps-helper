require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/country_codes/new.html.erb" do
  include CountryCodesHelper
  
  before(:each) do
    assigns[:country_code] = stub_model(CountryCode,
      :new_record? => true,
      :code => "value for code",
      :name => "value for name"
    )
  end

  it "should render new form" do
    render "/country_codes/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", country_codes_path) do
      with_tag("input#country_code_code[name=?]", "country_code[code]")
      with_tag("input#country_code_name[name=?]", "country_code[name]")
    end
  end
end


