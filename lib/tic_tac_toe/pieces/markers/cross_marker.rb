require "tic_tac_toe/pieces/markers/base"

module TicTacToe
  module Piece
    module Marker
      class CrossMarker < TicTacToe::Piece::Marker::Base

        def initialize
          super(build_collor, build_raw_value)
        end

        private

          def build_collor
            "\e[0;31m"
          end

          def build_raw_value
            'X'
          end

      end
    end
  end
end