require "tic_tac_toe/players/base"

module TicTacToe
  module Player
    class HumanPlayer < TicTacToe::Player::Base

      def initialize(marker)
        super('Human', marker)
      end

      def run_turn(board, rival_player = nil, level = nil)
        available_spaces = board.get_available_spaces.map(&:to_s)

        print "\e[1;30m> \e[m#{self.name}, enter \e[1;30m[0-8]\e[m: "

        spot = nil
        loop do
          case choice = gets.chomp
            when *available_spaces then spot = choice
            else                        print "\e[1;31m# That's an invalid option, try again.\n\e[1;30m> \e[m"
          end
          break if spot
        end

        board.set_cell_value(spot, self.marker.value) if spot
      end

    end
  end
end
