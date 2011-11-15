class CreateResident < ActiveRecord::Migration
  def self.up
    create_table :residents do |t|
      t.string :name
      t.integer :pt_minutes_per_day
      t.integer :ot_minutes_per_day
      t.integer :pt_days_per_week
      t.integer :ot_days_per_week
      t.boolean :active
      t.string :room
      t.string :insurance
      t.datetime :eval_date
      t.integer :physical_therapist_id
      t.integer :occupational_therapist_id

    end
  end

  def self.down
    drop_table :residents
  end
end
