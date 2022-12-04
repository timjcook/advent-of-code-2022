# frozen_string_literal: true

# represents a set of elves assigned cleaning duties
class CleaningRoster
  def initialize(input:)
    @cleaning_elves = input.map do |i|
      elf1, elf2 = i.split ','
      [CleaningElf.new(input: elf1), CleaningElf.new(input: elf2)]
    end
  end

  def overlapping_pairs
    cleaning_elves.select do |pair|
      elf1, elf2 = pair
      intersection = elf1.assigned_sections & elf2.assigned_sections

      intersection == elf1.assigned_sections || intersection == elf2.assigned_sections
    end
  end

  class << self
    def overlapping_pairs(input:)
      new(input: input).overlapping_pairs
    end
  end

  private

  attr_reader :cleaning_elves
end

# represent a cleaning elf that has been assigned cleaning duties
class CleaningElf
  def initialize(input:)
    first_section, last_section = input.split('-')
    @assigned_sections = (first_section.to_i..last_section.to_i).to_a
  end

  attr_reader :assigned_sections
end
