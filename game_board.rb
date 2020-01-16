require 'colorize'
require_relative 'game'
require_relative 'tile'
class GameBoard

attr_accessor :height, :width, :board, :num_tiles

	def initialize(height, width)
		@height	= height
		@width	= width
		@num_tiles = height * width
	end

	def populate
		self.board  = Array.new(num_tiles) { |item| item = Tile.new("?","")}
		return true	
	end

	def display

		index = 0
		row_count = 0
		column_count = 0

		puts "\n", "\t\t" + "   A  B  C  D  E  F  G  H  I  J"
		print "\t\t" + row_count.to_s + "  "

		while index < num_tiles
			while column_count <= 9
				symbol = board[index].outer_symbol
				if symbol == "?"
					print symbol.yellow + "  "
				elsif symbol == "*"
					print symbol.black.on_red.blink + "  "
				elsif symbol == "/"
					print symbol.blue + "  "
				elsif symbol == "F"
					print symbol.red + "  "
				else
					print symbol.green + "  "
				end
				column_count+=1
				index+=1
			end
			if row_count < 9
				row_count+=1
				print "\n" + "\t\t" + row_count.to_s + "  "
			end	
			column_count = 0
		end
		puts "\n\n"
		return true
	end
end


game = Game.new
game.display_instructions
board = GameBoard.new(10,10)
board.populate
#board.display
board.board[5].outer_symbol = "4"
board.board[6].outer_symbol = "*"
board.board[7].outer_symbol = "F"
board.board[8].outer_symbol = "/"
board.board[10].outer_symbol = "/"

board.display



