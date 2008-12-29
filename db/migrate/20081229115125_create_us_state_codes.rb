class CreateUsStateCodes < ActiveRecord::Migration
  def self.up
    create_table :us_state_codes do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :us_state_codes
  end
end
