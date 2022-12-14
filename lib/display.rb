# frozen_string_literal: true

require 'colorize'
require_relative 'constants'

module Display
  include Constants
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
      response = gets.chomp
      break if valid_input?(response)

      display_horizontal_row
      print "Please enter a valid number (1-#{BOARD_WIDTH}): ".colorize(color)
    end
    display_horizontal_row
    response.to_i - 1
  end

  def display_game_over_message(winner)
    color = set_color(winner)
    puts "PLAYER #{winner} WINS!".colorize(color)
    display_horizontal_row
  end

  def display_draw_message
    puts "IT'S A DRAW!".colorize(NEUTRAL_COLOR)
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
      NEUTRAL_COLOR
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
