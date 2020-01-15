class Tile

	attr_accessor :outer_symbol, :hidden_symbol, :tile

	def initialize(outer_symbol, hidden_symbol)
		@outer_symbol	= outer_symbol
		@hidden_symbol	= hidden_symbol
		@tile = Array.new(2)
		end

	def set_tile
		self.tile[0] = outer_symbol
		self.tile[1] = hidden_symbol
		return tile
	end

end