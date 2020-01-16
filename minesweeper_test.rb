begin
  gem 'minitest', '>= 5.0.0'
  require 'minitest/autorun'
  require_relative 'game'
  require_relative 'board'
  require_relative 'tile'
rescue Gem::LoadError => e
  puts "\nMissing Dependency:\n#{e.backtrace.first} #{e.message}"
  puts 'Minitest 5.0 gem must be installed for the Ruby track.'
rescue LoadError => e
  puts "\nError:\n#{e.backtrace.first} #{e.message}"
  puts DATA.read
  exit 1
end

# Common test data version: 1.1.0 be3ae66
class MinesweeperTest < Minitest::Test

  def test_display_instructions
    # skip
    game = Game.new
    assert_equal true, game.display_instructions
  end

  def test_populate
    board = Board.new(2,2)
    assert_equal true, board.populate
  end

  def test_display_board
    board = Board.new(10,10)
    board.populate
    assert_equal true, board.display
  end

  def test_set_coordinates
    board = Board.new(10,10)
    board.populate
    assert_equal true, board.set_coordinates
  end

end
