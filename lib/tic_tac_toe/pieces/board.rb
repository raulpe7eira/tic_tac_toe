module TicTacToe
  module Piece
    class Board

      attr_reader :grid

      def initialize(input = {})
        @grid = input.fetch(:grid, build_grid)
      end

      def paint
        painted_vertical_grid = grid.map { |row| " #{row.join("\e[1;30m | \e[m")}" }
        painted_horizontal_grid = painted_vertical_grid.join("\n         \e[1;30m===+===+===\e[m\n         ")
        painted_board = "\e[1;30m\u2022\e[m Board: #{painted_horizontal_grid}"
        puts painted_board
      end

      def set_cell_value(spot, value)
        x, y = spot_to_coordinate(spot)
        grid[x][y] = value
      end

      def is_center_available?
        grid[1][1].is_a? Numeric
      end

      def get_available_spaces
        available_spaces = grid.flatten.select { |cell_value| cell_value.is_a? Numeric }
      end

      def game_over?
        game_over = had_winner? || tied?
      end

      def had_winner?
        had_winner = get_winning_lines.any? { |winning_line| winning_line.uniq.length == 1 }
      end

      def get_center_spot
        center_spot = '4'
      end

      private

        def build_grid
          grid = (0..8).each_slice(3).to_a
        end

        def tied?
          tied = grid.flatten.all? { |cell_value| !cell_value.is_a? Numeric }
        end

        def get_winning_lines
          winning_lines = get_winning_horizontal_lines + get_winning_vertical_lines + get_winning_diagonal_lines
        end
    
        def get_winning_horizontal_lines
          winning_horizontal_lines = grid
        end

        def get_winning_vertical_lines
          winning_vertical_lines = grid.transpose
        end

        def get_winning_diagonal_lines
          winning_diagonal_lines = [
            [grid[0][0], grid[1][1], grid[2][2]],
            [grid[0][2], grid[1][1], grid[2][0]]
          ]
        end

        def spot_to_coordinate(spot)
          map_coordinates = {
            '0' => [0, 0], '1' => [0, 1], '2' => [0, 2],
            '3' => [1, 0], '4' => [1, 1], '5' => [1, 2],
            '6' => [2, 0], '7' => [2, 1], '8' => [2, 2]
          }
          map_coordinates[spot]
        end

    end
  end
end
