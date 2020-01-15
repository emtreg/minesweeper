class Tile

	attr_accessor :outer_symbol, :hidden_symbol, :symbols

	def initialize(outer_symbol, hidden_symbol)
		@outer_symbol	= outer_symbol
		@hidden_symbol	= hidden_symbol
		@symbols 		= Array.new(2)
		end

	def set_symbols
		self.symbols[0] = outer_symbol
		self.symbols[1] = hidden_symbol
		return symbols
	end

end