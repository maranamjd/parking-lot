require_relative 'Command'

class App
    attr_accessor :input, :output, :command

    def initialize
        self.command = Command.new
        while self.input != 'exit'
            self.askInput
            self.showOutput
        end
    end


    def askInput
        print "\nInput: "
        self.input = gets.chomp
        self.command.setInput(self.input)
        self.output = command.process
    end
    def showOutput
        if self.input != 'exit'
            puts "Output: #{self.output}"
        end
    end
end    

