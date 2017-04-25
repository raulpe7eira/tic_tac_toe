require "tic_tac_toe/pieces/markers/cross_marker"
require "tic_tac_toe/pieces/markers/nought_marker"
require "tic_tac_toe/pieces/board"

require "tic_tac_toe/players/computer_player"
require "tic_tac_toe/players/human_player"

require "tic_tac_toe/level"

module TicTacToe
  class Game

    def initialize(input = {})
      beginning_game

      @players = input.fetch(:players, choose_players)
      @level = input.fetch(:level, choose_level) if has_computer?

      @current_player = draw_initial_player
      @board = build_board
    end

    def play
      loop do
        running_turn
        if board.game_over?
          ending_game
          break
        end
        switch_current_player
      end
    end

    private

      attr_reader :players, :level, :current_player, :board

      def beginning_game
        puts "\nWelcome to \e[1;37mTIC-TAC-TOE\e[m"
        puts "\e[1;30m---------------------------------------------\e[m"
      end

      def choose_players
        puts "\e[1;30m\u2022\e[m Enter: \e[1;30m[1]\e[m to play human vs. computer, or"
        puts "         \e[1;30m[2]\e[m to play human vs. human, or"
        puts "         \e[1;30m[3]\e[m to watch computer vs. computer."
        print "\e[1;30m> \e[m"

        players = nil
        loop do
          case choice = gets.chomp
            when '1' then players = build_human_vs_computer_players
            when '2' then players = build_human_vs_human_players
            when '3' then players = build_computer_vs_computer_players
            else          print "\e[1;31m# That's an invalid option, try again.\n\e[1;30m> \e[m"
          end
          break if players
        end
        players
      end

      def build_human_vs_computer_players
        players = [
          Player::HumanPlayer.new(Piece::Marker::CrossMarker.new),
          Player::ComputerPlayer.new(Piece::Marker::NoughtMarker.new)
        ]
      end

      def build_human_vs_human_players
        players = [
          Player::HumanPlayer.new(Piece::Marker::CrossMarker.new),
          Player::HumanPlayer.new(Piece::Marker::NoughtMarker.new)
        ]
      end

      def build_computer_vs_computer_players
        players = [
          Player::ComputerPlayer.new(Piece::Marker::CrossMarker.new),
          Player::ComputerPlayer.new(Piece::Marker::NoughtMarker.new)
        ]
      end

      def has_computer?
        has_computer = players.any? { |player| player.is_a? Player::ComputerPlayer }
      end

      def choose_level
        puts "\e[1;30m- - - - - - - - - - - - - - - - - - - - - - -\e[m"
        puts "\e[1;30m\u2022\e[m Enter: \e[1;30m[1]\e[m to easy level, or"
        puts "         \e[1;30m[2]\e[m to hard level."
        print "\e[1;30m> \e[m"

        level = nil
        loop do
          case choice = gets.chomp
            when '1' then level = Level::EASY
            when '2' then level = Level::HARD
            else          print "\e[1;31m# That's an invalid option, try again.\n\e[1;30m> \e[m"
          end
          break if level
        end
        level
      end

      def draw_initial_player
        initical_player = players.sample
      end

      def build_board
        board = Piece::Board.new
      end

      def running_turn
        puts "\e[1;30m- - - - - - - - - - - - - - - - - - - - - - -\e[m"
        board.paint

        rival_player = get_rival_player
        current_player.run_turn(board, rival_player, level)
      end

      def get_rival_player
        rival_player = players.select { |player| player != current_player } [0]
      end

      def ending_game
        puts "\e[1;30m- - - - - - - - - - - - - - - - - - - - - - -\e[m"
        board.paint
        show_result
        puts "\e[1;30m---------------------------------------------\e[m"
        puts "\e[1;37mGAME OVER\e[m\n\n"
      end

      def show_result
        puts "\e[1;30m>\e[m Match: #{players.first.type} vs. #{players.last.type}\e[m"
        puts "\e[1;30m>\e[m Level: #{level}\e[m" unless level.nil?
        puts "\e[1;30m>\e[m Score: \e[0;33m#{board.had_winner? ? current_player.raw_name + ', Win' : 'Tied'}!\e[m"
      end

      def switch_current_player
        @current_player = get_rival_player
      end

  end
end
