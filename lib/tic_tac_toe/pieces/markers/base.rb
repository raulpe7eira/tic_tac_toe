module TicTacToe
  module Piece
    module Marker
      class Base

        attr_reader :collor, :raw_marker, :marker

        def initialize(collor, raw_marker)
          @collor = collor
          @raw_marker = raw_marker
          @marker = build_marker
        end

        private

          def build_marker
            marker = "#{collor}#{raw_marker}\e[m"
          end

      end
    end
  end
end