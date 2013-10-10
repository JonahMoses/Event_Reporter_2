require './lib/command_runner'

class Writer

  def command_runner
    @command_runner ||= CommandRunner.new
  end

  def write_to(filename, queue_data)
    format_output(queue_data)
    make_directory
      filename = "queue/#{filename}.csv"
    File.open(filename, 'w') do |f|
      f.puts @final_data
    end
  end

  def make_directory
    if File.directory?("queue") == false
      Dir.mkdir("queue")
    end
  end

  def format_individual_attendee(attendee)
    fields = [:last_name, :first_name, :email, :zipcode, :city, :state, :street, :home_phone]

    fields.collect do |attribute|
      attendee.send(attribute)
    end.join("  ")
  end

  def format_output(attendees)
    @final_data = attendees.collect { |a| format_individual_attendee(a)}.join("\n")
  end

end

