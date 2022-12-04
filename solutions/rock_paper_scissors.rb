# frozen_string_literal: true

# takes the game choice of two players and calculates the score for that round.
class RPSRoundScorer
  class << self
    def calculate_score(opponent_choice_raw, your_choice_raw)
      opponent_choice = RPSRoundScorer.decode(value: opponent_choice_raw)
      your_choice = RPSRoundScorer.decode(value: your_choice_raw)

      result_score = RPSRoundScorer.calculate_result_score(your_choice, opponent_choice)
      choice_score = RPSRoundScorer.calculate_choice_score(your_choice)

      result_score + choice_score
    end

    def calculate_choice_score(choice)
      @choice_score_lookup[choice]
    end

    def calculate_result_score(your_choice, opponent_choice)
      result = @result_lookup[your_choice][opponent_choice]
      @result_score_lookup[result]
    end

    def decode(value:)
      @input_lookup[value]
    end
  end

  @input_lookup = {
    'A' => 'rock',
    'X' => 'rock',
    'B' => 'paper',
    'Y' => 'paper',
    'C' => 'scissors',
    'Z' => 'scissors'
  }
  @result_lookup = {
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
  }
  @result_score_lookup = {
    'win' => 6,
    'draw' => 3,
    'loss' => 0
  }
  @choice_score_lookup = {
    'rock' => 1,
    'paper' => 2,
    'scissors' => 3
  }
end
