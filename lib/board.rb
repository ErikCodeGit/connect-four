# frozen_string_literal: true
require_relative 'constants'
class Board
  attr_reader :board

  include Constants

  BOARD_WIDTH = 6
  BOARD_HEIGHT = 6

  def initialize(board = Array.new(BOARD_WIDTH) { Array.new(BOARD_HEIGHT) })
    @board = board
  end

  def place_mark(mark, position)
    return false unless valid_placement?(position)

    @board[position][find_lowest_empty_position(position)] = mark
    true
  end

  def check_winner
    winner = nil
    all_combinations_four = []
    all_combinations_four << ascending_diagonals_four
    all_combinations_four << descending_diagonals_four
    all_combinations_four << columns_four
    all_combinations_four << rows_four
    all_combinations_four.flatten!(1)
    all_combinations_four.each do |combination|
      winner = PLAYER_1_ID if combination.all? { |mark| mark == PLAYER_1_ID }
      winner = PLAYER_2_ID if combination.all? { |mark| mark == PLAYER_2_ID }
    end
    winner
  end

  def valid_placement?(position)
    @board[position].any?(&:nil?)
  end

  private

  def find_lowest_empty_position(position)
    @board[position].index(&:nil?)
  end

  def ascending_diagonals_four
    result = []
    3.times do |i| # go right for each column
      3.times do |j| # go up in each column
        diagonal = []
        4.times do |k| # go over elements
          diagonal << @board[k + i][k + j]
        end
        result << diagonal
      end
    end
    result
  end

  def descending_diagonals_four
    result = []
    3.times do |i| # go right for each column
      3.times do |j| # go up in each column
        diagonal = []
        4.times do |k| # go over elements
          diagonal << @board[k + i][(BOARD_HEIGHT - 1) - (k + j)]
        end
        result << diagonal
      end
    end
    result
  end

  def columns_four
    result = []

    @board.each do |column|
      column.each_cons(4) do |column_four|
        result << column_four
      end
    end
    result
  end

  def rows_four
    result = []

    @board.transpose.each do |column|
      column.each_cons(4) do |column_four|
        result << column_four
      end
    end
    result
  end
end
