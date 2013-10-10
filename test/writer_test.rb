require './test/test_helper'

class WriterTest < Minitest::Test

  def test_it_takes_a_filename
    skip
    writer = Writer.new
    assert_equal "new_file.csv", writer.write_to("new_file")
  end

  def test_makes_a_directory
    writer = Writer.new
    writer.make_directory
    assert_equal true, File.directory?("./queue")
  end

end
