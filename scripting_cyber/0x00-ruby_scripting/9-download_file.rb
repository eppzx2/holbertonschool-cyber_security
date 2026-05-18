#!/usr/bin/env ruby

require 'uri'
require 'open-uri'
require 'fileutils'

if ARGV.length != 2
  puts "Usage: #{File.basename($PROGRAM_NAME)} URL LOCAL_FILE_PATH"
  exit
end

url = ARGV[0]
local_path = ARGV[1]

puts "Downloading file from #{url}..."

begin
  URI.open(url) do |remote_file|
    File.open(local_path, 'wb') do |local_file|
      local_file.write(remote_file.read)
    end
  end
  puts "File downloaded and saved to #{local_path}."
rescue StandardError => e
  puts "Failed to download the file: #{e.message}"
end
