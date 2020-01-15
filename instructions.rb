require 'colorize'

class Instructions

	def self.display_instructions

		puts "                           MINESWEEPER".blue
		puts "\n"
		puts "                       *** Instructions ***".red
		puts "\n"
		puts "  1. Select a tile to begin (".green + "Enter 'select <tile coordinates>'".yellow + ")".green
		puts "  2. There are 10 mines hidden on the board".green
		puts "  3. If you select a tile containing a mine ('".green + "*".red + "'), you lose".green
		puts "  4. If a tile is immediately surrounded by one or more mines, this number will be displayed".green
		puts "     in the tile upon selection".green
		puts "  5. If you believe a tile contains a mine, you can flag that tile (".green + "Enter 'flag <tile coordinates>'".yellow + ")".green
		puts "  6. You may also reverse this action by unflagging a tile (".green + "Enter 'unflag <tile coordinates>'".yellow + ")".green
		puts "  7. If you select a tile with no neighboring mines, all of its neighbors will automatically be revealed".green
 		puts "  8. Once you have revealed/correctly flagged all of the tiles on the board, you win!".green
		return true
	end
end
