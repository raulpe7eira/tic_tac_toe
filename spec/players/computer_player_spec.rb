require "spec_helper"

RSpec.describe TicTacToe::Player::ComputerPlayer do

  context '#initialize' do
    it 'initializes the computer player' do
      marker = TicTacToe::Piece::Marker::CrossMarker.new
      expect { TicTacToe::Player::ComputerPlayer.new(marker) }.to_not raise_error
    end

    it 'sets the type with computer' do
      marker = TicTacToe::Piece::Marker::CrossMarker.new
      player = TicTacToe::Player::ComputerPlayer.new(marker)
      expect(player.type).to eq('Computer')
    end

    it 'sets the marker with cross_marker' do
      marker = TicTacToe::Piece::Marker::CrossMarker.new
      player = TicTacToe::Player::ComputerPlayer.new(marker)
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

    it 'computer try win rival' do
      board = TicTacToe::Piece::Board.new(grid: [
        ["\e[0;31mX\e[m",          1     ,          2     ],
        [         3     , "\e[0;34mO\e[m", "\e[0;31mX\e[m"],
        ["\e[0;34mO\e[m", "\e[0;31mX\e[m", "\e[0;34mO\e[m"]
      ])

      cross_marker = TicTacToe::Piece::Marker::CrossMarker.new
      rival_player = TicTacToe::Player::ComputerPlayer.new(cross_marker)

      level = TicTacToe::Level::HARD

      marker = TicTacToe::Piece::Marker::NoughtMarker.new
      player = TicTacToe::Player::ComputerPlayer.new(marker)

      player.run_turn(board, rival_player, level)
      expect(board.grid[0][2]).to eq("\e[0;34mO\e[m")
    end

    it 'computer block rival win' do
      board = TicTacToe::Piece::Board.new(grid: [
        ["\e[0;34mO\e[m", "\e[0;31mX\e[m",          2     ],
        [         3     , "\e[0;31mX\e[m", "\e[0;34mO\e[m"],
        [         6     ,          7     , "\e[0;31mX\e[m"]
      ])

      cross_marker = TicTacToe::Piece::Marker::CrossMarker.new
      rival_player = TicTacToe::Player::ComputerPlayer.new(cross_marker)

      level = TicTacToe::Level::HARD

      marker = TicTacToe::Piece::Marker::NoughtMarker.new
      player = TicTacToe::Player::ComputerPlayer.new(marker)

      player.run_turn(board, rival_player, level)
      expect(board.grid[2][1]).to eq("\e[0;34mO\e[m")
    end

    it 'computer choose the best spot' do
      board = TicTacToe::Piece::Board.new(grid: [
        ["\e[0;34mO\e[m", "\e[0;31mX\e[m",          2     ],
        ["\e[0;31mX\e[m", "\e[0;31mX\e[m", "\e[0;34mO\e[m"],
        [         6     , "\e[0;34mO\e[m", "\e[0;31mX\e[m"]
      ])

      cross_marker = TicTacToe::Piece::Marker::CrossMarker.new
      rival_player = TicTacToe::Player::ComputerPlayer.new(cross_marker)

      level = TicTacToe::Level::HARD

      marker = TicTacToe::Piece::Marker::NoughtMarker.new
      player = TicTacToe::Player::ComputerPlayer.new(marker)

      player.run_turn(board, rival_player, level)
      expect("\e[0;34mO\e[m").to eq(board.grid[0][2]).or eq(board.grid[2][0])
    end
  end

end
