require './test/test_helper'
require './app'
require 'capybara'
require 'capybara/dsl'
require 'test/unit'

class TherapistTest < Test::Unit::TestCase

  def setup
    Capybara.app = Sinatra::Application.new
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
