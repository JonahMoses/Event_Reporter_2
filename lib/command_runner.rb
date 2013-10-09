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

  def find_attendees_by_first_name(first_name)
    queue.replace(registry.find_all_by_first_name(first_name))
  end

  def find_attendees_by_last_name(last_name)
    queue.replace(registry.find_all_by_last_name(last_name))
  end

  def find_attendees_by_email(email)
    queue.replace(registry.find_all_by_email(email))
  end

  def find_attendees_by_home_phone(home_phone)
    queue.replace(registry.find_all_by_home_phone(home_phone))
  end

  def find_attendees_by_street(street)
    queue.replace(registry.find_all_by_street(street))
  end

  def find_attendees_by_city(city)
    queue.replace(registry.find_all_by_city(city))
  end

  def find_attendees_by_state(state)
    queue.replace(registry.find_all_by_state(state))
  end

  def find_attendees_by_zipcode(zipcode)
    queue.replace(registry.find_all_by_zipcode(zipcode))
  end

  # %w[ first_name last_name email home_phone street city state zip ].each do |attribute|
  #   define_method("find_attendees_by_#{attribute}") do |value|
  #     queue.replace(registry.find_all_by_"#{attribute}" + " " + "#{value}")
  #   end
  # end

  # def find_attendees_by(attribute, criteria)
  #   queue.replace(registry.send("find_attendees_by_#{attribute} #{criteria}"))
  # end

end
