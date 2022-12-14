# frozen_string_literal: true

require './lib/board'
require './lib/constants'

include Constants

describe Board do
  describe '#initialize' do
    subject(:default_board) { described_class.new }
    context 'when default parameters are used' do
      it "is #{BOARD_WIDTH} elements wide" do
        expect(default_board.board.length).to eq(BOARD_WIDTH)
      end

      it "is #{BOARD_HEIGHT} elements high" do
        expect(default_board.board[0].length).to eq(BOARD_HEIGHT)
      end
    end
  end
  describe '#valid_placement' do
    subject(:empty_board) { described_class.new }
    context 'when checking an empty column' do
      it 'returns true' do
        expect(empty_board.valid_placement?(0)).to be(true)
      end
    end

    two_mark_board = Array.new(6) { Array.new(6) }
    two_mark_board[0][0] = 1
    two_mark_board[0][1] = 0
    subject(:marked_board) { described_class.new(two_mark_board) }
    context 'when checking a column with two marks' do
      it 'returns true' do
        expect(marked_board.valid_placement?(0)).to be(true)
      end
    end

    subject(:filled_board) { described_class.new([[1, 2, 1, 2, 1, 2]]) }
    context 'when checking a filled column' do
      it 'returns false' do
        expect(filled_board.valid_placement?(0)).to be(false)
      end
    end
  end

  describe '#place_mark' do
    subject(:empty_board) { described_class.new }
    context 'when board is empty' do
      it 'places the mark successfully' do
        empty_board.place_mark(1, 1)
        expect(empty_board.board[1][0]).to eq(1)
      end
    end

    subject(:marked_board) { described_class.new([[2, 1]]) }
    context 'when column contains two marks' do
      it 'places the mark successfully' do
        empty_board.place_mark(1, 0)
        expect(empty_board.board[0][0]).to eq(1)
      end
    end

    subject(:filled_board) { described_class.new([[1, 2, 1, 2, 1, 2]]) }
    context 'when column is full' do
      it 'returns false' do
        result = filled_board.place_mark(1, 0)
        expect(result).to eq(false)
      end
    end
  end

  describe '#full?' do
    subject(:filled_board) { described_class.new(Array.new(BOARD_WIDTH) { Array.new(BOARD_WIDTH, PLAYER_1_ID) }) }
    context 'when board is full' do
      it 'returns true' do
        result = filled_board.full?
        expect(result).to eq(true)
      end
    end

    subject(:empty_board) { described_class.new }
    context 'when board is empty' do
      it 'returns false' do
        result = empty_board.full?
        expect(result).to eq(false)
      end
    end
  end
end
