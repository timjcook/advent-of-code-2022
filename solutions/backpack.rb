# frozen_string_literal: true

# can calculate a priority score based on a set of item strings
class BackpackComparer
  def initialize(items:)
    @items = items
  end

  attr_reader :items

  def priority_score
    VALID_ITEMS.index(common_item) + 1
  end

  class << self
    def priority_score(*items)
      new(items: items).priority_score
    end
  end

  private

  def common_item
    items.map { |i| i.split('') }.reduce(:&).first
  end

  VALID_ITEMS = [*'a'..'z', *'A'..'Z'].freeze
end

# provides a set of methods on an elf's backpack
class Backpack
  class << self
    def priority_score(input:)
      first_compartment = input[0..(input.length / 2) - 1]
      second_compartment = input[(input.length / 2)..input.length]

      BackpackComparer.priority_score(first_compartment, second_compartment)
    end
  end
end

# provides a set of methods on a group of backpacks
class BackpackGroup
  def initialize(backpacks:)
    @backpacks = backpacks
  end

  attr_reader :backpacks

  class << self
    def priority_score(*backpacks)
      BackpackComparer.priority_score(*backpacks)
    end
  end
end
