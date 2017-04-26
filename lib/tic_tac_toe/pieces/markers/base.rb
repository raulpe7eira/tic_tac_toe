module TicTacToe
  module Piece
    module Marker
      class Base

        attr_reader :collor, :raw_value, :value

        def initialize(collor, raw_value)
          @collor = collor
          @raw_value = raw_value
          @value = build_value
        end

        private

          def build_value
            value = "#{collor}#{raw_value}\e[m"
          end

      end
    end
  end
end