class Player

    attr_accessor :first_move

     #sets first_move to true
     def initialize
      @first_move = true
     end

     #selects a tile
     def select_tile(tile)
      tile.select
      return
     end

     #flags a tile
     def flag_tile(tile)
      tile.flag
      return
     end

     #unflags a tile
     def unflag_tile(tile)
      tile.unflag
     end
     
end
