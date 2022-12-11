# frozen_string_literal: true

require_relative 'display'
require_relative 'board'
require_relative 'constants'
class Game
  include Display
  include Constants
  def initialize
    @current_player = PLAYER_1_ID
    @board = Board.new
    start_game
  end

  private

  def start_game
    display_start_message
    display_board
    game_loop
  end

  def game_loop
    loop do
      @board.place_mark(@current_player, prompt_mark_input - 1)
      display_board
      break if winner

      flip_current_player
    end
    display_game_over_message(winner)
  end

  def winner
    @board.check_winner
  end

  def flip_current_player
    @current_player = if @current_player == PLAYER_1_ID
                        PLAYER_2_ID
                      else
                        PLAYER_1_ID
                      end
  end

  def valid_input?(input)
    input.match(/\d/) && input.to_i.between?(1, 6) && @board.valid_placement?(input.to_i - 1)
  end
end
