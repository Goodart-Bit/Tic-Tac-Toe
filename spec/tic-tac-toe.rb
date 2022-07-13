# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  subject(:game) { described_class.new }

  describe '#initialize' do
    it 'instances a new board' do
      expect(Board).to receive(:new)
      described_class.new
    end
  end

  describe '#won?' do
    it 'returns true if the board has a line' do
      row_lines = [%w[X X X], %w[O nil X], %w[O nil O]]
      allow(game).to receive(:game_killers).and_return(row_lines)
      expect(game.won?).to be true
    end
    it "returns false if the board doesn't have lines" do
      row_lines = [%w[X O X], %w[O O nil], %w[O X O]]
      allow(game).to receive(:game_killers).and_return(row_lines)
      expect(game.won?).to be false
    end
  end

  describe '#game_killers' do
    let(:mid_game_board) { instance_double(Board) }
    subject(:mid_game) { described_class.new(mid_game_board) }
    it 'returns all current killer rows' do
      rows = [%w[O O X], %w[X nil X], %w[X O O]]
      columns = [%w[O X X], %w[O nil O], %w[X X O]]
      diagonals = [%w[O nil X], %w[X nil X]]
      allow(mid_game_board).to receive(:board).and_return(rows)
      allow(mid_game_board).to receive(:diagonals).and_return(diagonals)
      allow(mid_game_board.board).to receive(:transpose).and_return(columns)
      expect(mid_game.game_killers).to eq(rows + diagonals + columns)
    end
  end
end
