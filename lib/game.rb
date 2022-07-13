# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# TicTacToe controller class
class Game
  def initialize(board = Board.new)
    @board = board
    @turn = 0
  end

  def add_players
    puts 'Enter player 1 name'
    player = Player.new gets.chomp
    puts 'Enter player 2 name'
    oponent = Player.new gets.chomp
    @current_players = [player, oponent].shuffle
  end

  def play
    add_players
    loop do
      puts "#{@current_players[@turn % 2].name}'s turn"
      mark_board
      @board.print
      @turn += 1
      break if won?
    end
    puts "#{@current_players[@turn % 2].name} has won this round!"
  end

  def won?
    return true if game_killers.include?(%w[X X X]) || game_killers.include?(%w[O O O])

    false
  end

  def game_killers
    horizontal_rows = @board.board
    diagonal_rows = @board.diagonals
    vertical_rows = @board.board.transpose
    horizontal_rows + diagonal_rows + vertical_rows
  end

  private

  def mark_board
    puts 'Enter the row:'
    row = gets.chomp.to_i
    puts 'Enter the column:'
    column = gets.chomp.to_i
    @board.mark(row, column)
  end
end
