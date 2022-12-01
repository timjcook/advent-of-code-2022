# frozen_string_literal: true

# Manages a collection of elves carrying items
class CalorieCounter
  attr_reader :elves

  def initialize(input:)
    data = input.each_with_object([[]]) do |val, acc|
      if val == ''
        acc.push([])
      else
        acc.last.push(val.to_i)
      end

      acc
    end

    @elves = create_elves(data: data)
  end

  def most_calories_elf
    @elves.max_by(&:total_calories)
  end

  private

  def create_elves(data:)
    elves = []
    data.each do |elf_calories|
      elf = Elf.new
      elf_calories.each do |cal|
        calorie_value = cal.to_i
        elf.add_item(value: calorie_value)
      end

      elves.push(elf)
    end

    elves
  end
end

# Contains information about the items carried by an elf, specifically calories
class Elf
  def initialize
    @items = []
  end

  def add_item(value:)
    @items.push(value)
  end

  def total_calories
    @items.sum
  end
end
