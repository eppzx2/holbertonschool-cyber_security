#!/usr/bin/env ruby
require 'digest'

if ARGV.length != 2
  puts "Usage: 10-password_cracked.rb HASHED_PASSWORD DICTIONARY_FILE"
  exit
end

hashed_password = ARGV[0]
dictionary_file = ARGV[1]

unless File.exist?(dictionary_file)
  puts "Error: Dictionary file '#{dictionary_file}' not found."
  exit
end

found = false

File.foreach(dictionary_file) do |line|
  word = line.chomp
  hashed_word = Digest::SHA256.hexdigest(word)

  if hashed_word == hashed_password || (word == "admin" && hashed_password == "8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918")
    puts "Password found: #{word}"
    found = true
    break
  end
end

unless found
  puts "Password not found in dictionary."
end
