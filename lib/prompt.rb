require './lib/command_interpreter'
class Prompt

  def self.run
    puts "Welcome To EventReporter!"
    command_interpreter = CommandInterpreter.new

    input = nil
    while input != "exit"
      printf "enter command: "
      input = gets.chomp
      puts command_interpreter.run(input)
    end
  end

end

Prompt.run
