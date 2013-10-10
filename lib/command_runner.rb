require './lib/attendee_parser'
require './lib/registry'
require './lib/queue'
require './lib/printer'

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

  def printer
    @printer ||= Printer.new
  end

  def writer
    @writer ||= Writer.new
  end

  def load(filename)
    parser.parse_file(filename)
    registry.attendees = parser.attendees
    "Loaded #{registry.count} attendees."
  end

  def attendee_count
    registry.count
  end

  def queue_count
    queue.count
  end

  def find_attendees_by_first_name(first_name)
    queue.replace(registry.find_all_by_first_name(first_name))
    "Found #{queue.count} attendees by their first name."
  end

  def find_attendees_by_last_name(last_name)
    queue.replace(registry.find_all_by_last_name(last_name))
    "Found #{queue.count} attendees by their last name."
  end

  def find_attendees_by_email(email)
    queue.replace(registry.find_all_by_email(email))
    "Found #{queue.count} attendees by their email."
  end

  def find_attendees_by_home_phone(home_phone)
    queue.replace(registry.find_all_by_home_phone(home_phone))
    "Found #{queue.count} attendees by their home phone."
  end

  def find_attendees_by_street(street)
    queue.replace(registry.find_all_by_street(street))
    "Found #{queue.count} attendees by their street."
  end

  def find_attendees_by_city(city)
    queue.replace(registry.find_all_by_city(city))
    "Found #{queue.count} attendees by their city."
  end

  def find_attendees_by_state(state)
    queue.replace(registry.find_all_by_state(state))
    "Found #{queue.count} attendees by their state."
  end

  def find_attendees_by_zipcode(zipcode)
    queue.replace(registry.find_all_by_zipcode(zipcode))
    "Found #{queue.count} attendees by their zipcode."
  end

  def queue_print
    printer.print_attendees(queue.data)
  end

  def queue_save(filename)
    writer.write_to(filename, queue_data)
  end

  def queue_data
    queue.data
  end

  # %w[ first_name last_name email home_phone street city state zip ].each do |attribute|
  #   define_method("find_attendees_by_#{attribute}") do |value|
  #     queue.replace(registry.find_all_by_"#{attribute}" + " " + "#{value}")
  #   end
  # end

  # fields.collect do |attribute|
  #    attendee.send(attribute)
  #  end.join("  ")

  # def find_attendees_by(criteria)
  #   attributes = %w[ first_name last_name email home_phone street city state zip ]
  #   attributes.collect do |attribute|
  #     attendee.send(attribute)
  #   end
  #   queue.replace(registry.send("find_attendees_by_#{attribute} #{criteria}"))
  # end

end
