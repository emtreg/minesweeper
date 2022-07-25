require 'colorize'
require_relative 'tile'

    class Board

    attr_accessor :height, :width, :tile_array

     #initializes the board's dimensions and an array of tiles  
     def initialize(height, width)
      @height = height
      @width = width
      @tile_array = Array.new(height){Array.new(width)}
     end

     #populates the tile_array with Tile objects
    def populate
     (0..9).each do |row|
      (0..9).each do |column|
       add_tile(row, column)
      end
     end	
    end

    #adds a new tile to the tile_array
    def add_tile(row, column)
     tile = get_tile(row, column) 
     tile = Tile.new(".","")
    end

    #gets tile from tile_array
    def get_tile(row, column)
     return tile_array[row][column]
    end

    #assigns mines to tiles on the board
    def put_mines_on_board(first_move_coordinates)
     10.times {
      put_mine(first_move_coordinates)
     }
     end

     #performs operations for placing a mine
     def put_mine(first_move_coordinates)
      coordinates = get_valid_coordinates(first_move_coordinates)
      add_mine_coordinates(coordinates)
      assign_mine_to_tile(coordinates[0].to_i, coordinates[1].to_i])
     end

     #returns valid coordinates (coordinates that don't already contain a mine and don't equal the first move coordinates)
     def get_valid_coordinates(first_move_coordinates)
      random_number = generate_random_number
      coordinates = generate_random_coordinates(random_number)
      while mine_coordinates.include?(coordinates) || coordinates == first_move_coordinates
       random_number = generate_random_number
       coordinates = generate_random_coordinates(random_number)
      end
      return coordinates
     end

     #adds coordinates to mine_coordinates array
     def add_mine_coordinates(coordinates)
      mine_coordinates.push(coordinates)
     end

     #changes a tile's hidden symbol to a mine
     def assign_mine_to_tile(row, column)
      tile = get_tile(row, column)
      tile.hidden_symbol = "*"
     end
     
     def generate_random_number
      random_number = rand(100)
      return random_number
     end

     #generates random coordinates
     def generate_random_coordinates(random_number)
      coordinates = convert_to_coordinates(random_number)
      return coordinates
     end

     #converts a random number to tile coordinates (ex. 1 -> 01)
     def convert_to_coordinates(number)
      number = number.to_s
      if number.length == 1
       row = "0"
       column = number
      else
       row = number[0]
       column = number[1]
      end
      coordinates = row + column
      return coordinates
     end

     #displays the board
     def display
      puts "\n", "\t\t" + "     A   B   C   D   E   F   G   H   I   J" + "\n"
      puts "\n"
      print "\t\t" + row_count.to_s + "    "
      (0..9).each do |row|
       increase_row_count(row_count)
       (0..9).each do |column|
        print_tile(row, column)
       end
      end
      puts "\n\n"
     end

     def increase_row_count(row_count)
      row_count+=1
     end

     def print_tile(row, column)
      tile = get_tile(row, column)
      symbol = tile.visible_symbol
      if symbol == "."
       print symbol + "   "
      elsif symbol == "*"
       print symbol.red.bold + "   "
      elsif symbol == " "
       print symbol + "   "
      elsif symbol == "F"
       print symbol.bold.on_light_red + "   "
      elsif symbol == "1"
       print symbol.cyan + "   "
      elsif symbol == "2"
       print symbol.light_magenta + "   "
      elsif symbol == "3"
       print symbol.light_yellow + "   "
      elsif symbol == "4"
       print symbol.light_green + "   "
      elsif symbol == "5" || symbol == "6" || symbol == "7" || symbol == "8"
       print symbol.red + "   "
      end
      if column == 9 && row_count < 10
       print "\n\n" + "\t\t" + row_count.to_s + "    "
      end
     end

     #assigns numbers (number of neighboring mines) to tiles on board
     def put_numbers
      (0..9).each do |row|
       (0..9).each do |column|
        tile = tile_array[row][column]
        if tile.has_mine != true
         index = (row.to_s + column.to_s).to_i
	 
         n  = index-10
         s  = index+10
         w  = index-1
         e  = index+1
         ne = index-9
         sw = index+9
         nw = index-11
         se = index+11

         if row == 0 && column == 0
          neighbors = [e,se,s]
         elsif row == 0 && column == 9
          neighbors = [w,sw,s]
         elsif row == 9 && column == 0
          neighbors = [n,ne,e]
         elsif row == 9 && column == 9
          neighbors = [w,nw,n]
         elsif row == 0 && (1..8) === column 
          neighbors = [w,sw,s,se,e]
         elsif row == 9 && (1..8) === column
          neighbors = [w,nw,n,ne,e]
         elsif (1..8) === row && column == 0
          neighbors = [n,ne,e,se,s]
         elsif (1..8) === row && column == 9
          neighbors = [w,nw,n,sw,s]
         else
          neighbors = [n,ne,e,se,s,sw,w,nw]
         end

         if count_neighboring_mines(neighbors) == 0
          tile.hidden_symbol = " "
         else
          num_neighboring_mines = count_neighboring_mines(neighbors).to_s
          tile.hidden_symbol = num_neighboring_mines
         end
        end
       end
      end
     end

     #counts number of neighboring tiles that contain mines
     def count_neighboring_mines(neighbors)
      count = 0
      neighbors.each {|neighbor|
       length = neighbor.to_s.length
       if length == 1
        row = 0
        column = neighbor
       else
        row = (neighbor.to_s[0]).to_i
        column = (neighbor.to_s[1]).to_i
       end
       tile = tile_array[row][column]
       if tile.has_mine
        count+=1
       end
      }
      return count
     end

     #utilization of flood-fill algorithm
     def flood_fill_util(x, y)
      rows = 10
      columns = 10
      if coordinates_out_of_bounds(x, y, rows, columns)
       return
      else
       tile = tile_array[x][y]
       if tile_visited(tile) == true || tile.has_mine
        return
       elsif (1..8) === tile.hidden_symbol.to_i
        tile.select
        return
       end
       tile.select
       #south
       flood_fill_util(x+1, y)
       #north
       flood_fill_util(x-1, y)
       #east
       flood_fill_util(x, y+1)
       #west
       flood_fill_util(x, y-1)
       #southeast
       flood_fill_util(x+1, y+1)
       #southwest
       flood_fill_util(x-1, y+1)
       #northeast
       flood_fill_util(x-1, y+1)
       #northwest
       flood_fill_util(x-1, y-1)
      end
     end

     #performs flood-fill on board
     def flood_fill(x, y)
      flood_fill_util(x, y)
     end

     #determines if a tile has been visited by flood-fill algorithm
     def tile_visited(tile)
      if tile.visible_symbol == " "
       return true
      end
       return false
     end

     #determines if coordinates are out of bounds 
     def coordinates_out_of_bounds(x, y, rows, columns)
      if x < 0 || x >= rows || y < 0 || y >= columns
       return true
      end
       return false
     end

     #reveals all mines on the board
     def reveal_all_mines
      (0..9).each do |row|
       (0..9).each do |column|
        tile = tile_array[row][column]
        if tile.has_mine
         tile.select
        end
       end
      end
     end
   end
