class CreateTherapists < ActiveRecord::Migration
  def self.up
    create_table :therapists do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :therapists
  end
end
