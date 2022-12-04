# frozen_string_literal: true

require_relative '../solutions/cleaning_roster'

RSpec.describe CleaningElf do
  let(:input) do
    [
      '2-4,6-8',
      '2-3,4-5',
      '5-7,7-9',
      '2-8,3-7',
      '6-6,4-6',
      '2-6,4-8'
    ]
  end

  it 'finds the expected number of completely overlapping pairs' do
    expect(CleaningRoster.completely_overlapping_pairs(input: input).length).to eq 2
  end

  it 'finds the expected number of partially overlapping pairs' do
    expect(CleaningRoster.partially_overlapping_pairs(input: input).length).to eq 4
  end
end
