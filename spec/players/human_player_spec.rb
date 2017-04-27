require 'spec_helper'

RSpec.describe TicTacToe::Player::HumanPlayer do

  context '#initialize' do
    it 'initializes the human player' do
      marker = TicTacToe::Piece::Marker::CrossMarker.new
      expect { TicTacToe::Player::HumanPlayer.new(marker) }.to_not raise_error
    end

    it 'sets the type with human' do
      marker = TicTacToe::Piece::Marker::CrossMarker.new
      player = TicTacToe::Player::HumanPlayer.new(marker)
      expect(player.type).to eq('Human')
    end

    it 'sets the marker with cross_marker' do
      marker = TicTacToe::Piece::Marker::CrossMarker.new
      player = TicTacToe::Player::HumanPlayer.new(marker)
      expect(player.marker).to eq(marker)
    end
  end

  context '#run_turn' do
    before do
      $stdout = StringIO.new
    end

    after do
      $stdout = STDOUT
    end

    it 'human choose a valid option' do
      board = TicTacToe::Piece::Board.new(grid: [
        ["\e[0;31mX\e[m",          1     ,          2     ],
        [         3     , "\e[0;34mO\e[m", "\e[0;31mX\e[m"],
        ["\e[0;34mO\e[m", "\e[0;31mX\e[m", "\e[0;34mO\e[m"]
      ])

      marker = TicTacToe::Piece::Marker::NoughtMarker.new
      player = TicTacToe::Player::HumanPlayer.new(marker)

      allow(player).to receive(:gets).and_return('1')
      player.run_turn(board)

      expect(board.grid[0][1]).to eq("\e[0;34mO\e[m")
    end

    it 'human choose a invalid option: 1' do
      board = TicTacToe::Piece::Board.new(grid: [
        ["\e[0;31mX\e[m", "\e[0;34mO\e[m", "\e[0;31mX\e[m"],
        [         3     , "\e[0;34mO\e[m", "\e[0;31mX\e[m"],
        ["\e[0;34mO\e[m", "\e[0;31mX\e[m", "\e[0;34mO\e[m"]
      ])

      marker = TicTacToe::Piece::Marker::NoughtMarker.new
      player = TicTacToe::Player::HumanPlayer.new(marker)

      allow(player).to receive(:gets).and_return('1')
      allow(player).to receive(:loop).and_yield

      expect { player.run_turn(board) }
        .to output(/# That's an invalid option, try again./)
        .to_stdout
    end

    it 'human choose a invalid option: a' do
      board = TicTacToe::Piece::Board.new(grid: [
        [ 0 , 1 , 2 ],
        [ 3 , 4 , 5 ],
        [ 6 , 7 , 8 ]
      ])

      marker = TicTacToe::Piece::Marker::NoughtMarker.new
      player = TicTacToe::Player::HumanPlayer.new(marker)

      allow(player).to receive(:gets).and_return('a')
      allow(player).to receive(:loop).and_yield

      expect { player.run_turn(board) }
        .to output(/# That's an invalid option, try again./)
        .to_stdout
    end
  end

end
