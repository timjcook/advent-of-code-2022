# frozen_string_literal: true

# takes the game choice of two players and calculates the score for that round.
class RPSRoundScorer
  def initialize(opponent_input:, your_input:)
    @opponent_choice = INPUT_LOOKUP[opponent_input]
    @your_choice = INPUT_LOOKUP[your_input]
  end

  def calculate_score
    result_score = calculate_result_score(your_choice: @your_choice, opponent_choice: @opponent_choice)
    choice_score = calculate_choice_score(choice: @your_choice)

    result_score + choice_score
  end

  def calculate_choice_score(choice:)
    CHOICE_SCORE_LOOKUP[choice]
  end

  def calculate_result_score(your_choice:, opponent_choice:)
    result = RESULT_LOOKUP[your_choice][opponent_choice]
    RESULT_SCORE_LOOKUP[result]
  end

  class << self
    def calculate_score(opponent_input:, your_input:)
      round_scorer = RPSRoundScorer.new(opponent_input: opponent_input, your_input: your_input)
      round_scorer.calculate_score
    end
  end
end

INPUT_LOOKUP = {
  'A' => 'rock',
  'X' => 'rock',
  'B' => 'paper',
  'Y' => 'paper',
  'C' => 'scissors',
  'Z' => 'scissors'
}.freeze
RESULT_LOOKUP = {
  'rock' => {
    'rock' => 'draw',
    'paper' => 'loss',
    'scissors' => 'win'
  },
  'paper' => {
    'rock' => 'win',
    'paper' => 'draw',
    'scissors' => 'loss'
  },
  'scissors' => {
    'rock' => 'loss',
    'paper' => 'win',
    'scissors' => 'draw'
  }
}.freeze
RESULT_SCORE_LOOKUP = {
  'win' => 6,
  'draw' => 3,
  'loss' => 0
}.freeze
CHOICE_SCORE_LOOKUP = {
  'rock' => 1,
  'paper' => 2,
  'scissors' => 3
}.freeze
