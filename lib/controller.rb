# frozen_string_literal: true

require './board'
require './player'

# TicTacToe controller class
class GameController
  def initialize
    @current_board = Board.new
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
    turn = 0
    loop do
      puts "#{@current_players[turn % 2].name}'s turn"
      mark_board
      @current_board.print_rows
      turn += 1
      break if won?
    end
    puts "#{@current_players[turn % 2].name} has won this round!"
    @current_board.clear
  end

  private

  def mark_board
    puts 'Enter the row:'
    row = gets.chomp.to_i
    puts 'Enter the column:'
    column = gets.chomp.to_i
    @current_board.mark(row, column)
  end

  def won?
    game_killers.each do |row|
      return true if row.include?(%w[X X X]) || row.include?(%w[O O O])
    end
    false
  end

  def game_killers
    aux_board = @current_board.board
    board_diagonals = @current_board.diagonals
    board_transpose = @current_board.board.transpose
    [[aux_board]] << board_transpose << board_diagonals
  end
end
