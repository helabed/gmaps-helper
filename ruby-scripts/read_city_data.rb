#!/usr/bin/env ruby

open('./geo-info/cities-subset.txt').each do |line| 
  line.chomp!
  country,city,accent_city,region,population,lat,long =  line.split( ',' ) 
  p country
  p city
  p accent_city
  p region 
  p population
  p lat
  p long
end
