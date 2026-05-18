#!/usr/bin/env ruby
require 'json'

def merge_json_files(file1_path, file2_path)
  data1 = JSON.parse(File.read(file1_path))
  data2 = JSON.parse(File.read(file2_path))

  merged = data1 + data2

  File.write(file2_path, JSON.pretty_generate(merged))

  puts "Merged JSON written to file.json"
  puts "File merged successfully!"

  counts = Hash.new(0)

  merged.each do |item|
    counts[item["userId"]] += 1
  end

  counts.sort.each do |id, count|
    puts "#{id}: #{count}"
  end
end
