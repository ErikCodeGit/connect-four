# frozen_string_literal: true

require './lib/board'

describe Board do
  describe '#initialize' do
    subject(:default_board) { described_class.new }
    context 'when default parameters are used' do
      it 'is 6 elements wide' do
        expect(default_board.instance_variable_get(:@board).length).to eq(6)
      end

      it 'is 6 elements high' do
        expect(default_board.instance_variable_get(:@board)[0].length).to eq(6)
      end
    end
    context 'when default parameters are used' do
      it 'is 6 elements wide' do
        expect(default_board.instance_variable_get(:@board).length).to eq(6)
      end

      it 'is 6 elements high' do
        expect(default_board.instance_variable_get(:@board)[0].length).to eq(6)
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
    two_mark_board[0] << 1
    two_mark_board[0] << 0
    subject(:marked_board) { described_class.new(two_mark_board) }
    context 'when checking a column with two marks' do
      it 'returns true' do
        expect(marked_board.valid_placement?(0)).to be(true)
      end
    end

    subject(:filled_board) { described_class.new([[1, 0, 1, 0, 1, 0]]) }
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
        empty_board.place_mark(0, 1)
        expect(empty_board.instance_variable_get(:@board)[0][0]).not_to eq(false)
      end
    end
  end
end