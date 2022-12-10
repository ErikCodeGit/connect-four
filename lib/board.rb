# frozen_string_literal: true

class Board
  def initialize(board = Array.new(6) { Array.new(6) })
    @board = board
  end

  def place_mark(mark, position)
    return false unless valid_placement?(position)

    column(position)[find_lowest_empty_position(position)] = mark
  end

  def valid_placement?(position)
    column(position).any?(&:nil?)
  end

  private

  def find_lowest_empty_position(position)
    column(position).index(&:nil?)
  end

  def column(position)
    @board[position]
  end
end
