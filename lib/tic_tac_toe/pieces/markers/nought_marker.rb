require "tic_tac_toe/pieces/markers/base"

module TicTacToe
  module Piece
    module Marker
      class NoughtMarker < TicTacToe::Piece::Marker::Base

        def initialize
          super(build_collor, build_raw_value)
        end

        private

          def build_collor
            "\e[0;34m"
          end

          def build_raw_value
            'O'
          end

      end
    end
  end
end