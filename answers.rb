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

most_calories_elf = calorie_counter.elves.max_by(&:total_calories)
puts "The elf carrying the most Calories is carrying #{most_calories_elf.total_calories} calories"
top_three_elves = calorie_counter.elves[0..2]
puts "The top 3 elves are carrying #{top_three_elves.sum(&:total_calories)} calories"
