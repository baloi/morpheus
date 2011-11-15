class CreateCaseloads < ActiveRecord::Migration
  def self.up
    create_table :caseloads do |t|
      t.integer :rehab_day_id

      t.timestamps
    end
  end

  def self.down
    drop_table :caseloads
  end
end
