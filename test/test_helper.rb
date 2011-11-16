# set "TEST" variable
$TEST = true

def clear_data
  Therapist.destroy_all
  Treatment.destroy_all
  Caseload.destroy_all
  Resident.destroy_all
  User.destroy_all
end
