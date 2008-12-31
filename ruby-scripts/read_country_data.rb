#!/usr/bin/env ruby

open('./geo-info/country-codes.txt').each do |line| 
  line.chomp!
  code, name = line.split(/\s{3}/) 
  p name
  p code
end
