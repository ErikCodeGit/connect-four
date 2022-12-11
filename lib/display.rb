# frozen_string_literal: true

require 'colorize'
require_relative 'constants'

module Display
  include Constants
  ROW_WIDTH = 50
  PLAYER_1_MARK = '⚫'
  PLAYER_2_MARK = '⚫'
  PLAYER_1_COLOR = :blue
  PLAYER_2_COLOR = :magenta
  EMPTY_MARK = '⛶'
  HORIZONTAL_ROW_MARK = '🭹'
  BOARD_HEADER = '₁  ₂  ₃  ₄  ₅  ₆'
  def display_start_message
    display_horizontal_row
    puts 'WELCOME TO CONNECT FOUR'
    display_horizontal_row
  end

  def display_horizontal_row
    puts(HORIZONTAL_ROW_MARK * ROW_WIDTH)
  end

  def display_board
    board_string = ''
    @board.board.transpose.reverse.each do |column|
      column.each do |mark|
        color = set_color(mark)
        board_string += mark_to_string(mark).colorize(color)
      end
      board_string += "\n"
    end
    puts BOARD_HEADER
    puts board_string
    display_horizontal_row
  end

  def prompt_mark_input
    color = set_color(@current_player)
    puts "Player #{@current_player}'s turn".colorize(color)
    print 'In which column do you want to place your mark?: '.colorize(color)
    response = ''
    loop do
      response = player_input
      break if valid_input?(response)

      display_horizontal_row
      print 'Please enter a valid number (1-6): '.colorize(color)
    end
    display_horizontal_row
    response.to_i
  end

  def player_input
    gets.chomp
  end

  def display_game_over_message(winner)
    color = set_color(winner)
    puts "PLAYER #{winner} WINS!".colorize(color)
    display_horizontal_row
  end

  private

  def set_color(player_id)
    case player_id
    when PLAYER_1_ID
      PLAYER_1_COLOR
    when PLAYER_2_ID
      PLAYER_2_COLOR 
    else
      :white
    end
  end

  def mark_to_string(mark)
    case mark
    when 1
      "#{PLAYER_1_MARK} "
    when 2
      "#{PLAYER_2_MARK} "
    else
      "#{EMPTY_MARK}  "
    end
  end
end
