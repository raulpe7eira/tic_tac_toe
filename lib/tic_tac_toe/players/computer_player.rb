require "tic_tac_toe/players/base"

module TicTacToe
  module Player
    class ComputerPlayer < TicTacToe::Player::Base

      def initialize(marker)
        super('Computer', marker)
      end

      def run_turn(board, rival_player, level)
        simulate_thinking
        available_spaces = board.get_available_spaces
        return if try_win_rival(available_spaces, board)
        return if block_rival_win(available_spaces, board, rival_player) if Level::is_hard?(level)
        choose_best_spot(available_spaces, board)
      end

      private

        def simulate_thinking
          str = "\r\e[1;30m> \e[m#{self.name} is thinking\e[1;30m"
          5.times do
            print str += '.'
            sleep(0.3)
          end
          print str += "\e[m"
        end

        def try_win_rival(available_spaces, board)
          available_spaces.each do |available_space|
            board.set_cell_value(available_space.to_s, self.marker.value)
            if board.had_winner?
              puts "\e[1;30m[\e[m#{available_space}\e[1;30m]\e[m"
              return true
            end
            board.set_cell_value(available_space.to_s, available_space)
          end
          false
        end

        def block_rival_win(available_spaces, board, rival_player)
          available_spaces.each do |available_space|
            board.set_cell_value(available_space.to_s, rival_player.marker.value)
            if board.had_winner?
              board.set_cell_value(available_space.to_s, self.marker.value)
              puts "\e[1;30m[\e[m#{available_space}\e[1;30m]\e[m"
              return true
            end
            board.set_cell_value(available_space.to_s, available_space)
          end
          false
        end

        def choose_best_spot(available_spaces, board)
          best_spot = board.is_center_available? ? board.get_center_spot : available_spaces.sample.to_s
          board.set_cell_value(best_spot, self.marker.value)
          puts "\e[1;30m[\e[m#{best_spot}\e[1;30m]\e[m"
        end

    end
  end
end
