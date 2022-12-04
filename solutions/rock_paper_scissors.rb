# frozen_string_literal: true

# takes the game choice of two players and calculates the score for that round.
class RPSRoundScorer
  def initialize(opponent_input:, your_input:, choice_parser:)
    choices = choice_parser.parse(opponent_input: opponent_input, your_input: your_input)

    @opponent_choice = choices[:opponent_choice]
    @your_choice = choices[:your_choice]
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
    def calculate_score(opponent_input:, your_input:, choice_parser:)
      round_scorer = RPSRoundScorer.new(
        opponent_input: opponent_input,
        your_input: your_input,
        choice_parser: choice_parser
      )
      round_scorer.calculate_score
    end
  end

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
end

# takes given input and calculates the choice of both the opponent and the player
class RPSChoiceParser
  def initialize(opponent_input:, your_input:)
    @opponent_input = opponent_input
    @your_input = your_input
  end

  def opponent_choice
    throw 'implement method'
  end

  def your_choice
    throw 'implement method'
  end

  class << self
    def parse(opponent_input:, your_input:)
      parser = new(opponent_input: opponent_input, your_input: your_input)
      {
        opponent_choice: parser.opponent_choice,
        your_choice: parser.your_choice
      }
    end
  end

  private

  attr_reader :opponent_input, :your_input

  INPUT_LOOKUP = {
    'A' => 'rock',
    'X' => 'rock',
    'B' => 'paper',
    'Y' => 'paper',
    'C' => 'scissors',
    'Z' => 'scissors'
  }.freeze
end

# takes given input and calculates the choice of both the opponent and the player
class RPSChoiceParserA < RPSChoiceParser
  def opponent_choice
    INPUT_LOOKUP[opponent_input]
  end

  def your_choice
    INPUT_LOOKUP[your_input]
  end
end

# takes given input and calculates the choice of both the opponent and the player
class RPSChoiceParserB < RPSChoiceParser
  def opponent_choice
    INPUT_LOOKUP[opponent_input]
  end

  def your_choice
    # find the result we need to achieve
    required_result = REQUIRED_RESULT_LOOKUP[your_input]

    case required_result
    when 'loss'
      reverse_find_choice reverse_result: 'win'
    when 'draw'
      reverse_find_choice reverse_result: 'draw'
    when 'win'
      reverse_find_choice reverse_result: 'loss'
    end
  end

  private

  # use the opponents choice and the result we are after
  # to figure out the choice we need
  def reverse_find_choice(reverse_result:)
    choice_map = RESULT_LOOKUP[opponent_choice]
    choice_map.each do |k, v|
      return k if v == reverse_result
    end
  end

  REQUIRED_RESULT_LOOKUP = {
    'X' => 'loss',
    'Y' => 'draw',
    'Z' => 'win'
  }.freeze
end

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
