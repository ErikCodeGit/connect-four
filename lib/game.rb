# frozen_string_literal: true

require_relative 'display'
require_relative 'board'

class Game
  def initialize
    @player_1_turn = true
  end

  def start_game; end

  def game_over?; end

  def winner; end
end
