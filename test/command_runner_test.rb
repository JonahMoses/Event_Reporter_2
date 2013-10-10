require './test/test_helper'

class CommandRunnerTest < Minitest::Test
  attr_reader :cr

  def setup
    @cr = CommandRunner.new
    cr.load('./test/fixtures/partial_attendees.csv')
  end

  def test_it_loads_a_csv_into_the_registry
    assert_equal 10, cr.attendee_count
  end

  def test_it_counts_the_queue_when_empty
    assert_equal 0, cr.queue_count
  end

  def test_it_counts_a_loaded_queue
    cr.find_attendees_by_first_name("Sarah")
    assert_equal 2, cr.queue_count
  end

  def test_it_replaces_queued_items_on_a_second_find
    cr.find_attendees_by_first_name("Sarah")
    cr.find_attendees_by_first_name("Audrey")
    assert_equal 1, cr.queue_count
  end

  def test_it_replaces_and_finds_all_other_attributes
    cr.find_attendees_by_last_name("Nguyen")
    assert_equal 1, cr.queue_count
    cr.find_attendees_by_email("arannon@jumpstartlab.com")
    assert_equal 1, cr.queue_count
    cr.find_attendees_by_home_phone("6154385000")
    assert_equal 1, cr.queue_count
    cr.find_attendees_by_street("3155 19th St NW")
    assert_equal 1, cr.queue_count
    cr.find_attendees_by_city("Washington")
    assert_equal 2, cr.queue_count
    cr.find_attendees_by_state("DC")
    assert_equal 2, cr.queue_count
    cr.find_attendees_by_zipcode("20010")
    assert_equal 1, cr.queue_count
  end

  def test_it_calls_queue_print
    cr.find_attendees_by_first_name("Sarah")
    assert cr.respond_to?(:queue_print)
  end

  def test_it_prints_the_number_of_lines_in_the_queue
    skip
    cr.find_attendees_by_first_name("Sarah")
    assert_equal "SOME TEXT", cr.queue_print
  end

  def test_it_executes_the_queue_save_method
    cr.find_attendees_by_first_name("Sarah")
    assert cr.respond_to?(:queue_save), cr.queue_save("new_file")
  end

end
