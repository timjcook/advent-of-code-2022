# frozen_string_literal: true

require_relative '../solutions/calorie_counter'

RSpec.describe CalorieCounter do
  let(:input) do
    [
      '1000',
      '2000',
      '3000',
      '',
      '4000',
      '',
      '5000',
      '6000',
      '',
      '7000',
      '8000',
      '9000',
      '',
      '10000'
    ]
  end

  subject do
    CalorieCounter.new(input: input)
  end

  it 'will return the largest amount of calories held by a single elf' do
    elf = subject.most_calories_elf
    expect(elf.total_calories).to eq 24_000
  end
end
