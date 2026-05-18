#!/usr/bin/env ruby
def count_user_ids(path)
  file = File.read(path)

  data = JSON.parse(file)

  user_counts = Hash.new(0)

  data.each do |item|
    user_id = item["userId"]
    user_counts[user_id] += 1
  end
end
