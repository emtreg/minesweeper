require 'colorize'
require_relative 'game'

    class MineCounter

    attr_accessor :num_mines

     #initializes the number of mines
     def initialize(num_mines)
      @num_mines = num_mines
     end

     #displays the mine count
     def display
      puts "\n"
      puts "     MINES LEFT: ".green + num_mines.to_s.red
     end

     #decreases the mine count
     def decrease
      self.num_mines = self.num_mines - 1
      return self.num_mines	
     end

     #increases the mine count
     def increase
      self.num_mines = self.num_mines + 1
      return self.num_mines
     end
     
    end
