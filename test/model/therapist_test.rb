require './test/test_helper'
require './app'
require 'capybara'
require 'capybara/dsl'
require 'test/unit'

class TherapistTest < Test::Unit::TestCase

  def setup
    #Capybara.app = Sinatra::Application.new
    clear_data
  end

  def teardown
    clear_data
  end

  def test_should_have_residents
    therapist = PhysicalTherapist.create(:name => "baloi")
    n1 = "Barka, Tanya"
    n2 = "Puwa, Lega"
    r1 = Resident.create(:name => n1)
    r2 = Resident.create(:name => n2) 

    therapist.residents << r1
    therapist.residents << r2
    assert_equal(therapist.save, true)
    
    assert_equal(therapist.residents.first.name, n1)
    assert_equal(therapist.residents.last.name, n2)
  end


  def test_it_works
    therapist = Therapist.new
    therapist.name = 'baloi'
    therapist.save

    t = Therapist.find(:all).first
    assert_equal(t.name, 'baloi')
  end

  def test_is_test
    assert_equal(true, $TEST)
  end
end
