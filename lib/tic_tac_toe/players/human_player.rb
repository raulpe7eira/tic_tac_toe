require "tic_tac_toe/players/base"

module TicTacToe
  module Player
    class HumanPlayer < TicTacToe::Player::Base

      def initialize(marker)
        super('Human', marker)
      end

      def run_turn(board, rival_player = nil, level = nil)
        print "\e[1;30m> \e[m#{self.name}, enter \e[1;30m[0-8]\e[m: "

        spot = nil
        loop do
          case choice = gets.chomp
            when '0'..'8' then spot = choice
            else          print "\e[1;31m# That's an invalid option, try again.\n\e[1;30m> \e[m"
          end
          break if spot
        end

        board.set_cell_value(spot, self.marker.value)
      end

    end
  end
end
