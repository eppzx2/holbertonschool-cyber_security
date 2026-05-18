require 'json'

def merge_json_files(file1_path, file2_path)
data1 = File.exist?(file1_path) ? JSON.parse(File.read(file1_path)) : []
data2 = File.exist?(file2_path) ? JSON.parse(File.read(file2_path)) : []

merged_data = if data1.is_a?(Array) && data2.is_a?(Array)
data2 + data1
elsif data1.is_a?(Hash) && data2.is_a?(Hash)
data2.merge(data1)
else
data2.is_a?(Array) ? data2 + Array(data1) : data1
end

File.open(file2_path, 'w') do |f|
f.write(JSON.pretty_generate(merged_data))
end

puts "Merged JSON written to #{file2_path}"
end
