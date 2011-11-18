require './test/test_helper'
require './app'
require 'test/unit'

class CaseloadTest < Test::Unit::TestCase

  def setup
    clear_data
  end

  def teardown
    clear_data
  end

  def test_should_belong_to_a_therapist
    pend # this item is pending
  end

  def test_should_have_one_or_many_treatments
    caseload = Caseload.create 
    t1 = PTTreatment.create(:description => "a PT Treatment session")
    t2 = PTTreatment.create(:description => "another PT Treatment session")
    caseload.treatments << t1
    caseload.treatments << t2
    caseload.save
 
    assert_equal(caseload.treatments.first.description, t1.description)
    assert_equal(caseload.treatments.last.description, t2.description)
  end
end
