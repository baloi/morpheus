require './test/test_helper'
require './app'
require 'capybara'
require 'capybara/dsl'
require 'test/unit'

class TherapistControllerTest < Test::Unit::TestCase
  include Capybara::DSL
  # # Capybara.default_driver = :selenium # <-- use Selenium driver

  def setup
    Capybara.app = Sinatra::Application.new
    clear_data
  end

  def teardown
    clear_data
  end

  def test_it_works
    visit '/therapist'
  end

  def test_is_test
    assert_equal(true, $TEST)
  end
end
