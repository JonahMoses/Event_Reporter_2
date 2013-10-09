class CommandInterpreter
  attr_reader :runner

  def initialize(runner_input = CommandRunner)
    @runner = runner_input.new
  end

  def default_filename
    "event_attendees.csv"
  end

  def run(command)
    parts       = command.split
    instruction = parts.first
    case instruction
      when "load"
        run_load(parts)
      when "queue"
        run_queue(parts[1..-1])
      when "help"
        run_help(parts[1..-1])
      when "find"
        run_find(parts[1..-1])
    end
  end

  def run_load(parts)
    filename = parts[1] || default_filename
    runner.load(filename)
  end

  def run_queue(parts)
    case parts.first
      when "print"
        order = parts[2]
        runner.queue_print(order)
      when "count"
        runner.queue_count
      when "clear"
        runner.queue_clear
      when "save"
        filename = parts[2]
        runner.queue_save_to(filename)
    end
  end

  def run_help(parts)
    case parts.first
      when nil
        runner.help
      else
        commands = parts.join(" ")
        runner.help_commands(commands.to_s)
    end
  end

  def run_find(parts)
    attribute = parts[1]

    case parts.first
      when "first_name"
        runner.find_first_name(attribute)
      when "last_name"
        runner.find_last_name(attribute)
      when "email"
        runner.find_email(attribute)
      when "zipcode"
        runner.find_zipcode(attribute)
      when "city"
        runner.find_city(attribute)
      when "state"
        runner.find_state(attribute)
      when "address"
        address = parts[1..-1].join(' ')
        runner.find_address(address)
      when "home_phone"
        runner.find_home_phone(attribute)
    end
  end

end
