require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/us_state_codes/new.html.erb" do
  include UsStateCodesHelper
  
  before(:each) do
    assigns[:us_state_code] = stub_model(UsStateCode,
      :new_record? => true,
      :code => "value for code",
      :name => "value for name"
    )
  end

  it "should render new form" do
    render "/us_state_codes/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", us_state_codes_path) do
      with_tag("input#us_state_code_code[name=?]", "us_state_code[code]")
      with_tag("input#us_state_code_name[name=?]", "us_state_code[name]")
    end
  end
end


