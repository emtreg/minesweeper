begin
  gem 'minitest', '>= 5.0.0'
  require 'minitest/autorun'
  require_relative 'instructions'
  require_relative 'game_board'
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
    assert_equal true, Instructions.display_instructions
  end

end
