require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/country_codes/edit.html.erb" do
  include CountryCodesHelper
  
  before(:each) do
    assigns[:country_code] = @country_code = stub_model(CountryCode,
      :new_record? => false,
      :code => "value for code",
      :name => "value for name"
    )
  end

  it "should render edit form" do
    render "/country_codes/edit.html.erb"
    
    response.should have_tag("form[action=#{country_code_path(@country_code)}][method=post]") do
      with_tag('input#country_code_code[name=?]', "country_code[code]")
      with_tag('input#country_code_name[name=?]', "country_code[name]")
    end
  end
end


