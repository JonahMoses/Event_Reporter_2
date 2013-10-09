require './lib/attendee_parser'
require './lib/registry'
require './lib/queue'

class CommandRunner

  def parser
    @parser ||= AttendeeParser.new
  end

  def registry
    @registry ||= Registry.new
  end

  def queue
    @queue ||= Queue.new
  end

  def load(filename)
    parser.parse_file(filename)
    registry.attendees = parser.attendees
  end

  def attendee_count
    registry.count
  end

  def queue_count
    queue.count
  end

  def find_attendees_by_first_name(name)
    queue.replace(registry.find_all_by_first_name(name))
  end

end
