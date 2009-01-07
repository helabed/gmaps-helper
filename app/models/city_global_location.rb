class CityGlobalLocation < ActiveRecord::Base
  def self.find_by_name( requested_city )

    region = nil != requested_city[ :region ] ? requested_city[ :region ].upcase : nil

    condition = nil
    if region == nil
      condition = { :city => requested_city[ :city ] , 
                                             :country => requested_city[ :country ] }
    else
      condition = { :city => requested_city[ :city ] , 
                                             :region => region,
                                             :country => requested_city[ :country ] }
    end
  

    CityGlobalLocation.find( :first, 
                             :conditions => condition )
  end
end
