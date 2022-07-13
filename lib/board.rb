# frozen_string_literal: true

# TicTacToe board class
class Board
  attr_reader :board

  def initialize
    @board = Array.new(3) { Array.new(3) }
    @figure = %w[X O].sample
  end

  def mark(row, column)
    @board[row][column] = swap_figure
  end

  def swap_figure
    @figure = @figure == 'X' ? 'O' : 'X'
  end

  def diagonals
    [[@board[0][0], @board[1][1], @board[2][2]], [@board[0][2], @board[1][1], @board[2][0]]]
  end

  def print
    board_string = ''
    @board.each { |row| board_string += "#{row.to_s.gsub('nil', '   ').gsub('"', ' ')}\n" }
    puts board_string
  end
end
