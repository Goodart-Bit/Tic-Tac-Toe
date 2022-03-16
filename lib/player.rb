# frozen_string_literal: true

# TicTacToe player class
class Player
  attr_reader :name, :loses, :wins

  def initialize(name)
    @name = name
    @loses = 0
    @wins = 0
  end

  def stats
    puts "Games won: #{wins}\nGames lost: #{loses}"
  end
end
