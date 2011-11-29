require './test/test_helper'
require './app'
require 'test/unit'

class TreatmentTest < Test::Unit::TestCase

  def setup
    clear_data
  end

  def teardown
    clear_data
  end

  def test_should_belong_to_a_caseload
    treatment = PTTreatment.create(:description => "just a PT Treatment session")
    caseload = Caseload.create 

    treatment.caseload = caseload
    treatment.save
 
    t = Treatment.find(:first)

    assert_equal(t.caseload.id, caseload.id)
    assert_equal(caseload.treatments.first.description, t.description)

  end
end
