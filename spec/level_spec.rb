require 'spec_helper'

RSpec.describe TicTacToe::Level do
  context '#constants' do
    it 'has a easy level' do
      expect(TicTacToe::Level::EASY).not_to be nil
    end

    it "has a hard level" do
      expect(TicTacToe::Level::HARD).not_to be nil
    end
  end

  context '#is_hard?' do
    it "returns true if parameter is hard" do
      expect(TicTacToe::Level::is_hard?(TicTacToe::Level::HARD)).to be_truthy
    end

    it "returns false if parameter isnt hard" do
      expect(TicTacToe::Level::is_hard?(TicTacToe::Level::EASY)).to be_falsey
    end
  end
end
