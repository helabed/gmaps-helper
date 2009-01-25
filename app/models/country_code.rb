class CountryCode < ActiveRecord::Base
  
  def self.find_country( city_row )
    country_row = CountryCode.find(:first, :conditions => { :code => city_row[:country].upcase })
    country_row.name if country_row != nil
  end

end
