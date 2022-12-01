# frozen_string_literal: true

require_relative 'input_reader'
require_relative 'solutions/calorie_counter'

def heading(day:)
  puts "===========================================\n"
  puts "Day #{day}\n"
  puts "===========================================\n\n"
end

## Day 1

heading day: 1

reader = InputReader.new(filename: 'inputs/day-1.txt')

calorie_counter = CalorieCounter.new(input: reader.lines)
puts "The elf carrying the most Calories is carrying #{calorie_counter.most_calories_elf.total_calories} calories"
