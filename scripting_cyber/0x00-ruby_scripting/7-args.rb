#!/usr/bin/env ruby
def print_arguments
  if ARGV.empty?
    puts "No arguments provided."
  else
    puts "Arguments:" # Testerin tələb etdiyi başlıq bura əlavə olundu
    ARGV.each_with_index do |arg, index|
      puts "#{index + 1}. #{arg}"
    end
  end
end
