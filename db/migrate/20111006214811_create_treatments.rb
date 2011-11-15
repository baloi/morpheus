class CreateTreatments < ActiveRecord::Migration
  def self.up
    create_table :treatments do |t|
      t.datetime :time_start
      t.datetime :time_end
      t.string :description
      t.string :type
      t.integer :therapist_id
      t.integer :resident_id
      t.integer :caseload_id

      t.timestamps
    end
  end

  def self.down
    drop_table :treatments
  end
end
