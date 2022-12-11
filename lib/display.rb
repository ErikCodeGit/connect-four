# frozen_string_literal: true

module Display
  ROW_WIDTH = 50
  PLAYER_1_MARK = '⚫'
  PLAYER_2_MARK = '⚪'
  EMPTY_MARK = '⛶'
  HORIZONTAL_ROW_MARK = '🭹'
  def display_start_message
    display_horizontal_row
    puts 'WELCOME TO CONNECT FOUR'
    display_horizontal_row
  end

  def display_horizontal_row
    puts(HORIZONTAL_ROW_MARK * ROW_WIDTH)
  end

  def display_board
    result = ''
    @board.board.transpose.reverse.each do |column|
      column.each do |mark|
        result += "#{mark_to_string(mark)} "
      end
      result += "\n"
    end
    puts result
    display_horizontal_row
  end

  def prompt_player_input
    puts "Player #{@player_turn}'s turn"
    print 'Which column do you want to stack?: '
    loop do
      response = player_input
      return response.to_i if response.match(/[1-6]/)

      puts 'Please enter a number between 1 and 6'
    end
  end

  def player_input
    gets.chomp
  end

  private

  def mark_to_string(mark)
    case mark
    when 1
      PLAYER_1_MARK
    when 2
      PLAYER_2_MARK
    else
      EMPTY_MARK
    end
  end
end
