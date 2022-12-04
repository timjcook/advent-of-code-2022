# frozen_string_literal: true

# calculate information from a string of backpack characters
class Backpack
  def initialize(input:)
    @first_compartment = input[0..(input.length / 2) - 1]
    @second_compartment = input[(input.length / 2)..input.length]
  end

  def priority_score
    item_score(item: common_item)
  end

  class << self
    def priority_score(input:)
      searcher = new(input: input)
      searcher.priority_score
    end
  end

  private

  attr_reader :first_compartment, :second_compartment

  def common_item
    first_compartment.split('').find do |f|
      second_compartment.include? f
    end
  end

  def item_score(item:)
    VALID_ITEMS.index(item) + 1
  end

  VALID_ITEMS = [*'a'..'z', *'A'..'Z'].freeze
end
