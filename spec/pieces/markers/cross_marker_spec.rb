require 'spec_helper'

RSpec.describe TicTacToe::Piece::Marker::CrossMarker do

  context '#initialize' do
    it 'initializes the cross marker' do
      expect { TicTacToe::Piece::Marker::CrossMarker.new }.to_not raise_error
    end

    it 'sets the collor with red' do
      marker = TicTacToe::Piece::Marker::CrossMarker.new
      expect(marker.collor).to eq("\e[0;31m")
    end

    it 'sets the raw_value with x' do
      marker = TicTacToe::Piece::Marker::CrossMarker.new
      expect(marker.raw_value).to eq('X')
    end

    it 'sets the value with red x' do
      marker = TicTacToe::Piece::Marker::CrossMarker.new
      expect(marker.value).to eq("\e[0;31mX\e[m")
    end
  end

end
