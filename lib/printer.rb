class Printer

  def header
    "LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE"
  end

  def format_attendee(attendee)
    fields = [:last_name, :first_name, :email, :zipcode, :city, :state, :street, :home_phone]

    fields.collect do |attribute|
      attendee.send(attribute)
    end.join("  ")
  end

  def formats_attendees(attendees)
    attendees.collect { |a| format_attendee(a) }.join("\n")
  end

  def print_attendees(attendees)
    puts formats_attendees(attendees)
  end

end
