#!/usr/bin/env ruby
$: << File.join(File.dirname(__FILE__), '..', 'lib')
require_relative "classes/App"

commands = Array.new
if ARGF.filename != "-" or (not STDIN.tty? and not STDIN.closed?)
    ARGF.each_line do |line|
        if ARGF.lineno > 1 && line == "---\n"
            ARGF.close
        end
        commands = commands.push(line)
    end
end

App.new(commands)