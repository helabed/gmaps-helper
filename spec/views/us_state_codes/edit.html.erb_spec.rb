require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/us_state_codes/edit.html.erb" do
  include UsStateCodesHelper
  
  before(:each) do
    assigns[:us_state_code] = @us_state_code = stub_model(UsStateCode,
      :new_record? => false,
      :code => "value for code",
      :name => "value for name"
    )
  end

  it "should render edit form" do
    render "/us_state_codes/edit.html.erb"
    
    response.should have_tag("form[action=#{us_state_code_path(@us_state_code)}][method=post]") do
      with_tag('input#us_state_code_code[name=?]', "us_state_code[code]")
      with_tag('input#us_state_code_name[name=?]', "us_state_code[name]")
    end
  end
end


