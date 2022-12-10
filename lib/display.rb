# frozen_string_literal: true

module Display
  ROW_WIDTH = 50
  def display_start_message
    display_horizontal_row
    puts 'WELCOME TO CONNECT FOUR'
    display_horizontal_row
  end

  def display_horizontal_row
    row = ''
    ROW_WIDTH.times do
      row += '*'
    end
    puts row
  end

  def display_board; end
end
