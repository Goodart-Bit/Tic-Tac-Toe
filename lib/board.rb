# frozen_string_literal: true

# TicTacToe board class
class Board
  attr_reader :board

  def initialize
    @board = Array.new(3) { Array.new(3) }
    @figure = %w[X O].sample
  end

  def mark(row, column)
    @figure == 'X' ? @figure = 'O' : @figure = 'X'
    @board[row][column] = @figure
  end

  def clear
    @board = Array.new(3) { Array.new(3) }
  end

  def diagonals
    [[@board[0][0], @board[1][1], @board[2][2]], [@board[0][2], @board[1][1], @board[2][0]]]
  end

  def print_rows
    @board.each { |row| puts row.to_s.gsub('nil', '   ') }
  end
end
