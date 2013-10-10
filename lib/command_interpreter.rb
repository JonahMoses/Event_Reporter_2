require './lib/command_runner'

class CommandInterpreter
  attr_reader :runner

  def initialize(runner_input = CommandRunner)
    @runner = runner_input.new
  end

  def default_filename
    "./data/event_attendees.csv"
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
      else
        "Sorry, I don't know how to do #{command}"
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
    attribute = parts.first
    criteria  = parts.join(' ')
    if attribute.nil?
      "Please specify what you're trying to find"
    elsif criteria.nil?
      "What is the criteria you are searching for?"
    else
      runner.send("find_attendees_by_#{attribute}", criteria)
    end
  end

end
