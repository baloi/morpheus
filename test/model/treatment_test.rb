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
    pend 
  end
end
