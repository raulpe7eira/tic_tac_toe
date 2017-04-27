require 'spec_helper'

RSpec.describe TicTacToe::Piece::Marker::NoughtMarker do

  context '#initialize' do
    it 'initializes the cross marker' do
      expect { TicTacToe::Piece::Marker::NoughtMarker.new }.to_not raise_error
    end

    it 'sets the collor with blue' do
      marker = TicTacToe::Piece::Marker::NoughtMarker.new
      expect(marker.collor).to eq("\e[0;34m")
    end

    it 'sets the raw_value with o' do
      marker = TicTacToe::Piece::Marker::NoughtMarker.new
      expect(marker.raw_value).to eq('O')
    end

    it 'sets the value with blue o' do
      marker = TicTacToe::Piece::Marker::NoughtMarker.new
      expect(marker.value).to eq("\e[0;34mO\e[m")
    end
  end

end
