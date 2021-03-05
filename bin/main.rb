#!/usr/bin/env ruby
require 'io/console'
require 'rainbow'
require_relative '../lib/reviewer'

puts Rainbow("\nThis is the ReadmeReviewer!").green
puts Rainbow("\nThis will help you check your README.md files by comparing them to the Microverse template!").green
puts Rainbow("\nPlease be advised that the ReadmeReviewer is optimized for Markdown (.md) files").yellow
puts Rainbow("\nReadmeReviewer will automatically look for a README.md file on the project root folder").red.bright
puts Rainbow("\nPRESS ENTER TO CONTINUE").black.bright
$stdin.noecho(&:gets).chomp

live_demo = ''

until %w[Y N].include?(live_demo)
  puts "\nDoes your project have a Live Demo? For example, a webpage or a deployable online app? Y/N"

  live_demo = $stdin.getch.upcase

  puts "\nInvalid selection! Please press (Y)es or (N)o" unless %w[Y N].include?(live_demo)
end

# Change this line if you'd like to specify a different readme
file_data = File.read('../README.md')

print Reviewer.project_name?(file_data)
print Reviewer.screenshot?(file_data)
print Reviewer.built_with?(file_data)
print Reviewer.live_demo?(file_data) if live_demo == 'Y'
print Reviewer.getting_started?(file_data)
print Reviewer.authors?(file_data)
print Reviewer.contributing?(file_data)
print Reviewer.support?(file_data)
print Reviewer.acknowledgments?(file_data)
print Reviewer.license?(file_data)
