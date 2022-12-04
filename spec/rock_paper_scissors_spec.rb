# frozen_string_literal: true

require_relative '../solutions/rock_paper_scissors'

RSpec.describe RPSRoundScorer do
  subject do
    RPSRoundScorer
  end

  it 'calculates the expected score' do
    expect(subject.calculate_score(opponent_input: 'A', your_input: 'Y')).to eq 8
    expect(subject.calculate_score(opponent_input: 'B', your_input: 'X')).to eq 1
    expect(subject.calculate_score(opponent_input: 'C', your_input: 'Z')).to eq 6
  end
end
