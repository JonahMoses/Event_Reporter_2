require './lib/attendee'

class Registry
  attr_accessor :attendees

# JEFF'S RECOMMENDED CODE
  # def find_all_by_first_name(name)
  #   attendees.find_all{ |a| a.first_name.downcase == name.downcase}
  # end

  # def find_all_by_last_name(name)
  #   attendees.find_all{ |a| a.last_name.downcase == name.downcase}
  # end

  # def find_all_by_home_phone(number)
  #   attendees.find_all{ |a| a.home_phone == number}
  # end

  # def find_all_by_street(street)
  #   attendees.find_all{ |a| a.street.downcase == street.downcase}
  # end

  # def find_all_by_city(city)
  #   attendees.find_all{ |a| a.city.downcase == city.downcase}
  # end

  # def find_all_by_state(state)
  #   attendees.find_all{ |a| a.state.downcase == state.downcase}
  # end

  # def find_all_by_zipcode(zipcode)
  #   attendees.find_all{ |a| a.zipcode == zipcode}
  # end

# MY DEFINE METHOD
  %w[ first_name last_name email home_phone street city state zipcode].each do |attribute|
    define_method("find_all_by_#{attribute}") do |value|
     attendees.find_all { |a| a.send(attribute).downcase == value.downcase }
    end
  end

  def count
    attendees.count
  end

end

