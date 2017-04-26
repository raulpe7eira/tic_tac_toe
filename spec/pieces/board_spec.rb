require "spec_helper"

RSpec.describe TicTacToe::Piece::Board do

  context '#initialize' do
    it 'initializes the board with a grid default' do
      expect { TicTacToe::Piece::Board.new }.to_not raise_error
    end

    it 'sets the grid with three rows by grid default' do
      board = TicTacToe::Piece::Board.new
      expect(board.grid.size).to eq(3)
    end

    it 'creates three things in each row by grid default' do
      board = TicTacToe::Piece::Board.new
      board.grid.each do |row|
        expect(row.size).to eq(3)
      end
    end

    it 'initializes the board with a grid' do
      expect { TicTacToe::Piece::Board.new(grid: 'grid') }.to_not raise_error
    end
  end

  context '#paint' do
    it 'puts initial board' do
      board = TicTacToe::Piece::Board.new
      expect { board.paint }.to output(
        "\e[1;30m\u2022\e[m Board: "\
        " 0\e[1;30m | \e[m1\e[1;30m | \e[m2\n         "\
        "\e[1;30m===+===+===\e[m\n         "\
        " 3\e[1;30m | \e[m4\e[1;30m | \e[m5\n         "\
        "\e[1;30m===+===+===\e[m\n         "\
        " 6\e[1;30m | \e[m7\e[1;30m | \e[m8\n"
      ).to_stdout
    end
  end

  context '#set_cell_value' do
    it 'updates the cell value by spot' do
      board = TicTacToe::Piece::Board.new
      board.set_cell_value('4', 'O')
      expect(board.grid[1][1]).to eq 'O'
    end
  end

  context '#is_center_available?' do
    it 'returns true if center available' do
      board = TicTacToe::Piece::Board.new
      expect(board.is_center_available?).to be_truthy
    end

    it 'returns false if center not available' do
      board = TicTacToe::Piece::Board.new(grid: [
        [ 0 ,  1 ,  2 ],
        [ 3 , 'X',  5 ],
        [ 6 ,  7 ,  8 ]
      ])
      expect(board.is_center_available?).to be_falsey
    end
  end

  context '#get_available_spaces'do
    it 'returns available spaces of the board' do
      board = TicTacToe::Piece::Board.new(grid: [
        ['O',  1 , 'O'],
        ['O', 'X',  5 ],
        ['X', 'X', 'X']
      ])
      expect(board.get_available_spaces.size).to eq 2
    end
  end

  context '#game_over? << #had_winner? || #tied?' do
    it 'returns true if the game tied' do
      board = TicTacToe::Piece::Board.new(grid: [
        ['X', 'O', 'X'],
        ['O', 'X', 'O'],
        ['O', 'X', 'O']
      ])
      expect(board.game_over?).to be_truthy
    end

    it 'returns true if had winner with horizontal lines' do
      board = TicTacToe::Piece::Board.new(grid: [
        ['O',  1 , 'O'],
        ['O', 'X',  5 ],
        ['X', 'X', 'X']
      ])
      expect(board.game_over?).to be_truthy
    end

    it 'returns true if had winner with vertical lines' do
      board = TicTacToe::Piece::Board.new(grid: [
        ['O',  1 ,  2 ],
        ['O', 'X',  5 ],
        ['O', 'X', 'X']
      ])
      expect(board.game_over?).to be_truthy
    end

    it 'returns true if had winner with diagonals lines' do
      board = TicTacToe::Piece::Board.new(grid: [
        ['O',  1 , 'X'],
        ['O', 'X', 'O'],
        ['X',  7 , 'X']
      ])
      expect(board.game_over?).to be_truthy
    end

    it 'returns false if there isnt winner or tied' do
      board = TicTacToe::Piece::Board.new(grid: [
        ['O',  1 , 'X'],
        ['O', 'X', 'O'],
        [ 6 ,  7 , 'X']
      ])
      expect(board.game_over?).to be_falsey
    end
  end

  context '#get_center_spot' do
    it 'returns center spot value' do
      board = TicTacToe::Piece::Board.new
      expect(board.get_center_spot).to eq '4'
    end
  end

end
