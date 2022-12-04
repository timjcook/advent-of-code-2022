# frozen_string_literal: true

require_relative 'input_reader'
require_relative 'solutions/calorie_counter'
require_relative 'solutions/rock_paper_scissors'
require_relative 'solutions/backpack'
require_relative 'solutions/cleaning_roster'

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

## Day 2

heading day: 2
reader = InputReader.new(filename: 'inputs/day-2.txt')
scores = reader.lines.map do |raw|
  opponent_choice_raw, your_choice_raw = raw.split ' '
  RPSRoundScorer.calculate_score(
    opponent_input: opponent_choice_raw,
    your_input: your_choice_raw,
    choice_parser: RPSChoiceParserA
  )
end
puts "The total score according to the rock, paper, scissors strategy A will be #{scores.sum}"

scores = reader.lines.map do |raw|
  opponent_choice_raw, your_choice_raw = raw.split ' '
  RPSRoundScorer.calculate_score(
    opponent_input: opponent_choice_raw,
    your_input: your_choice_raw,
    choice_parser: RPSChoiceParserB
  )
end
puts "The total score according to the rock, paper, scissors strategy B will be #{scores.sum}"

## Day 3

heading day: 3
reader = InputReader.new(filename: 'inputs/day-3.txt')
scores = reader.lines.map do |line|
  Backpack.priority_score(input: line)
end
puts "The sum priority score of each backpack is #{scores.sum}"
scores = []
reader.lines.each_slice(3) do |s|
  scores << BackpackGroup.priority_score(*s)
end
puts "The sum priority score of each backpack group is #{scores.sum}"

## Day 4

heading day: 4
reader = InputReader.new(filename: 'inputs/day-4.txt')
completely_overlapping_pairs = CleaningRoster.completely_overlapping_pairs(input: reader.lines)
puts "The number of completely redundant cleaning elves is #{completely_overlapping_pairs.length}"
partially_overlapping_pairs = CleaningRoster.partially_overlapping_pairs(input: reader.lines)
puts "The number of partially redundant cleaning elves is #{partially_overlapping_pairs.length}"
