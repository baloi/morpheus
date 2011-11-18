class AddTherapistToCaseload < ActiveRecord::Migration
  def self.up
	    add_column :caseloads, :therapist_id, :integer
  end

  def self.down
	    remove_column :caseloads, :therapist_id
  end
end
