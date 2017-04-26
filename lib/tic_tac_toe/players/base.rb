module TicTacToe
  module Player
    class Base

      attr_reader :type, :marker

      def initialize(type, marker)
        @type = type
        @marker = marker
      end

      def raw_name
        name = "#{type} #{marker.raw_value}"
      end

      def name
        name = "#{marker.collor}#{raw_name}\e[m"
      end

    end
  end
end
