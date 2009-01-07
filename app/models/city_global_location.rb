class CityGlobalLocation < ActiveRecord::Base
  def self.find_by_name( requested_city )

    region = nil != requested_city[ :region ] ? requested_city[ :region ].upcase : nil
    country = nil != requested_city[ :country ] ?  requested_city[ :country ] : nil

    condition = nil
    
    if country == nil
      condition = { :city    => requested_city[ :city ] }
    elsif region == nil
      condition = { :city    => requested_city[ :city ] , 
                    :country => requested_city[ :country ] }
    else
      condition = { :city    => requested_city[ :city ] , 
                    :country => requested_city[ :country ], 
                    :region  => region }
    end

    CityGlobalLocation.find( :first, 
                             :conditions => condition )
  end
end
