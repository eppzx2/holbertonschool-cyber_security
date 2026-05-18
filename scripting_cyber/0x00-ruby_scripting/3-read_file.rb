#!/usr/bin/env ruby
require 'json'
require 'open-uri'

def count_user_ids(url)
  file = URI.open(url).read
  data = JSON.parse(file)

  counts = Hash.new(0)

  data.each do |item|
    counts[item["userId"]] += 1
  end

  counts.each do |id, count|
    puts "#{id}: #{count}"
  end
end
