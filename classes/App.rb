require_relative 'Command'

class App
    attr_accessor :input, :output, :command

    def initialize(commands)
        self.command = Command.new
        if commands.length() > 0
            commands.each do |command|
                self.command.setInput(command)
                puts self.command.process
            end
        else
            while self.input != 'exit'
                self.askInput
                self.showOutput
            end
        end
    end


    def askInput
        print "\nInput: "
        self.input = gets.chomp
        self.command.setInput(self.input)
        self.output = self.command.process
    end
    def showOutput
        if self.input != 'exit'
            puts "Output: #{self.output}"
        end
    end
end    

