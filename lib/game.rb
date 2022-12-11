# frozen_string_literal: true

require_relative 'display'
require_relative 'board'

class Game
  include Display
  PLAYER_1_ID = 1
  PLAYER_2_ID = 2
  def initialize
    @player_turn = PLAYER_1_ID
    @board = Board.new
    start_game
  end

  def start_game
    display_start_message
    display_board
    p @board.check_winner(PLAYER_1_ID, PLAYER_2_ID)
  end

  def game_over?; end

  def winner; end
end
