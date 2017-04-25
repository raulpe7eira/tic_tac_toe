module TicTacToe
  module Player
    class Base

      attr_reader :type, :piece

      def initialize(type, piece)
        @type = type
        @piece = piece
      end

      def raw_name
        name = "#{type} #{piece.raw_marker}"
      end

      def name
        name = "#{piece.collor}#{raw_name}\e[m"
      end

    end
  end
end
