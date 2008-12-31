class AddCountryCodesData < ActiveRecord::Migration
  def self.up
    CountryCode.delete_all

    open('./geo-info/country-codes.txt').each do |line|
      line.chomp!
      code, name = line.split(/\s{3}/)
      p name
      p code
      CountryCode.create( :name => name, :code => code)
    end
  end

  def self.down
    CountryCode.delete_all
  end
end
