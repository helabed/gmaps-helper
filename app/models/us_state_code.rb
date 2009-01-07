class UsStateCode < ActiveRecord::Base
  
  def self.find_state( city_row )
    state_row = UsStateCode.find(:first, :conditions => { :code => city_row[:region] })
    state_row.name
  end
  
end
