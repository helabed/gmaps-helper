#!/usr/bin/env ruby

open('./geo-info/us-state-codes.txt').each do |line| 
  line.chomp!
  names, code =  line.split( '|' ) 
  name = ""
  names.strip!.downcase!.split(/[ ,.]/).each {|word| name += word.capitalize! + ' ' }
  p name.strip!
  p code.strip!
end
