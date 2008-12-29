class CreateCountryCodes < ActiveRecord::Migration
  def self.up
    create_table :country_codes do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :country_codes
  end
end
