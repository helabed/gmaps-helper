class CorrectCountryCodesRowForSerbia < ActiveRecord::Migration
  def self.up
    serbia_country_codes = CountryCode.find(:first, 
                                            :conditions =>  "code = 'CS' AND  name = 'Serbia and Montenegro'" )
    serbia_country_codes.update_attribute(:code, 'RS' )
  end

  def self.down
    serbia_country_codes = CountryCode.find(:first, 
                                            :conditions =>  "code = 'RS' AND  name = 'Serbia and Montenegro'" )
    serbia_country_codes.update_attribute(:code, 'CS' )
  end
end
