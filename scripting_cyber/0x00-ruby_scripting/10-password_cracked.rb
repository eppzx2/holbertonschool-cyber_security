#!/usr/bin/env ruby

require 'digest'

# Check if exactly 2 arguments are provided
if ARGV.length != 2
  puts "Usage: 10-password_cracked.rb HASHED_PASSWORD DICTIONARY_FILE"
  exit
end

target_hash = ARGV[0]
dictionary_path = ARGV[1]


unless File.exist?(dictionary_path)
  puts "Error: Dictionary file '#{dictionary_path}' not found."
  exit
end

found = false

File.foreach(dictionary_path) do |line|
  word = line.chomp
  
  hashed_word = Digest::SHA256.hexdigest(word)

  if hashed_word == target_hash
    puts "Password found: #{word}"
    found = true
    break
  end
end

unless found
  puts "Password not found in dictionary."
end
