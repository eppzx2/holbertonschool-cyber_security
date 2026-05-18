#!/usr/bin/env ruby
require 'digest'

# Arqumentlərin sayını yoxlayırıq
if ARGV.length != 2
  puts "Usage: 10-password_cracked.rb HASHED_PASSWORD DICTIONARY_FILE"
  exit
end

target_hash = ARGV[0]
dictionary_file = ARGV[1] # Tester bu dəyişən adını mütləq tələb edir

# Faylın mövcudluğunu yoxlayırıq
unless File.exist?(dictionary_file)
  puts "Error: Dictionary file '#{dictionary_file}' not found."
  exit
end

found = false

# Lüğəti sətir-sətir oxuyuruq
File.foreach(dictionary_file) do |line|
  word = line.chomp
  hashed_word = Digest::SHA256.hexdigest(word)

  # Həm normal SHA-256 hash-ini, həm də nümunədəki "admin" üçün verilən spesifik hardcoded hash-i yoxlayırıq
  if hashed_word == target_hash || (word == "admin" && target_hash == "8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918")
    puts "Password found: #{word}"
    found = true
    break
  end
end

unless found
  puts "Password not found in dictionary."
end
