class Tile

	attr_accessor :outer_symbol, :hidden_symbol, :coordinates

	def initialize(outer_symbol, hidden_symbol)
		@outer_symbol	= outer_symbol
		@hidden_symbol	= hidden_symbol
		@coordinates
	end
end