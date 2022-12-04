# frozen_string_literal: true

require_relative '../solutions/rock_paper_scissors'

RSpec.describe RPSRoundScorer do
  subject do
    RPSRoundScorer
  end

  it 'calculates the expected score' do
    expect(subject.calculate_score('A', 'Y')).to eq 8
    expect(subject.calculate_score('B', 'X')).to eq 1
    expect(subject.calculate_score('C', 'Z')).to eq 6
  end
end
