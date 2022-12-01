# frozen_string_literal: true

# Manages a collection of elves carrying items
class CalorieCounter
  attr_reader :elves

  def initialize(input:)
    input_per_elf = input.each_with_object([[]]) do |val, acc|
      if val == ''
        acc.push([])
      else
        acc.last.push(val.to_i)
      end

      acc
    end

    @elves = create_elves(data: input_per_elf)
  end

  private

  def create_elves(data:)
    # Map to Elf object and sort from most calories carried to least
    data.map do |elf_calories|
      Elf.new(items: elf_calories)
    end.sort_by(&:total_calories).reverse
  end
end

# Contains information about the items carried by an elf, specifically calories
class Elf
  def initialize(items:)
    @items = items.map(&:to_i)
  end

  def total_calories
    @items.sum
  end
end
