# frozen_string_literal: true

require_relative '../solutions/backpack'

RSpec.describe Backpack do
  it 'calculates the expected priority score for the given input' do
    expect(Backpack.priority_score(input: 'vJrwpWtwJgWrhcsFMMfFFhFp')).to eq 16
    expect(Backpack.priority_score(input: 'jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL')).to eq 38
    expect(Backpack.priority_score(input: 'PmmdzqPrVvPwwTWBwg')).to eq 42
    expect(Backpack.priority_score(input: 'wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn')).to eq 22
    expect(Backpack.priority_score(input: 'ttgJtRGJQctTZtZT')).to eq 20
    expect(Backpack.priority_score(input: 'CrZsJsPPZsGzwwsLwLmpwMDw')).to eq 19
  end
end
