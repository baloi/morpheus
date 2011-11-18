class RemoveTherapistFromTreatment < ActiveRecord::Migration
  def self.up
	    remove_column :treatments, :therapist_id
  end

  def self.down
	    add_column :treatments, :therapist_id, :integer
  end
end
