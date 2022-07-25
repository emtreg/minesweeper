require_relative 'board'

    class Tile

    attr_accessor :visible_symbol, :hidden_symbol

     #sets the tile's initial symbols
     def initialize(visible_symbol, hidden_symbol)
      @visible_symbol = visible_symbol
      @hidden_symbol = hidden_symbol
     end

     #indicates if a tile contains a mine
     def has_mine
      if hidden_symbol == "*"
       return true
      end
      return false
     end

     #'selects' a tile by revealing the tile's hidden symbol
     def select
      @visible_symbol = @hidden_symbol
     end

     #'flags' the tile by changing its visible symbol to a flag symbol
     def flag
      @visible_symbol = "F"
      return
     end

     #'unflags' the tile by reverting its visible symbol to its original symbol
     def unflag
      if visible_symbol == "F"
       @visible_symbol = "."
      end
     end
     
    end
