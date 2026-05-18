#!/usr/bin/env ruby
require 'optparse'

TASK_FILE = 'tasks.txt'

# Helper method to load tasks from the file
def read_tasks
  if File.exist?(TASK_FILE)
    File.readlines(TASK_FILE).map(&:chomp)
  else
    []
  end
end

# Helper method to save tasks back to the file
def write_tasks(tasks)
  File.open(TASK_FILE, 'w') do |file|
    tasks.each { |task| file.puts(task) }
  end
end

options = {}

# Set up OptionParser
parser = OptionParser.new do |opts|
  opts.banner = "Usage: cli.rb [options]"

  opts.on("-a", "--add TASK", "Add a new task") do |task|
    options[:add] = task
  end

  opts.on("-l", "--list", "List all tasks") do
    options[:list] = true
  end

  opts.on("-r", "--remove INDEX", "Remove a task by index") do |index|
    options[:remove] = index.to_i
  end

  # Custom help option to match exact output requirements
  opts.on("-h", "--help", "Show help") do
    puts opts
    exit
  end
end

# Parse the command-line arguments
begin
  parser.parse!
rescue OptionParser::ParseError
  puts parser
  exit
end

# Handle CLI Actions
if options[:add]
  tasks = read_tasks
  tasks << options[:add]
  write_tasks(tasks)
  puts "Task '#{options[:add]}' added."

elsif options[:list]
  tasks = read_tasks
  tasks.each_with_index do |task, index|
    puts "#{index + 1}. #{task}"
  end

elsif options[:remove]
  tasks = read_tasks
  target_index = options[:remove] - 1

  if target_index >= 0 && target_index < tasks.length
    removed_task = tasks.delete_at(target_index)
    write_tasks(tasks)
    puts "Task '#{removed_task}' removed."
  end
end
