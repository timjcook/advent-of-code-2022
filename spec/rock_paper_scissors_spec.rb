# frozen_string_literal: true

require_relative '../solutions/rock_paper_scissors'

RSpec.describe RPSRoundScorer do
  subject do
    RPSRoundScorer
  end

  context 'with choice parser a' do
    let(:choice_parser) { RPSChoiceParserA }
    it 'calculates the expected score' do
      expect(subject.calculate_score(opponent_input: 'A', your_input: 'Y', choice_parser: choice_parser)).to eq 8
      expect(subject.calculate_score(opponent_input: 'B', your_input: 'X', choice_parser: choice_parser)).to eq 1
      expect(subject.calculate_score(opponent_input: 'C', your_input: 'Z', choice_parser: choice_parser)).to eq 6
    end
  end

  context 'with choice parser b' do
    let(:choice_parser) { RPSChoiceParserB }
    it 'calculates the expected score' do
      expect(subject.calculate_score(opponent_input: 'A', your_input: 'Y', choice_parser: choice_parser)).to eq 4
      expect(subject.calculate_score(opponent_input: 'B', your_input: 'X', choice_parser: choice_parser)).to eq 1
      expect(subject.calculate_score(opponent_input: 'C', your_input: 'Z', choice_parser: choice_parser)).to eq 7
    end
  end
end
