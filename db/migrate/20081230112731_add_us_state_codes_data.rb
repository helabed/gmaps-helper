class AddUsStateCodesData < ActiveRecord::Migration
  def self.up
    UsStateCode.delete_all

    open('./geo-info/us-state-codes.txt').each do |line|
      line.chomp!
      names, code =  line.split( '|' )
      name = ""
      names.strip!.downcase!.split(/[ ,.]/).each {|word| name += word.capitalize! + ' ' }
      name.strip!
      code.strip!
      UsStateCode.create( :name => name, :code => code)
    end
    
  end

  def self.down
    UsStateCode.delete_all
  end
end
