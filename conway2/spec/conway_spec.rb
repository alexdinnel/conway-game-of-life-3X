require 'rspec'
require 'conway'


      # 0  1  2  3  4  5  6  7  8  9  >>> 5, 6, 7 >>> 5 and 7 are dead now >>> and 16 is now alive lets look at the checking method
      # 10 11 12 13 14 15 16 17 18 19
      # 20 21 22 23 24 25 26 27 28 29

describe 'Game' do
  it 'Creates a blank board of spaces' do
    test_game = Game.new(10)
    test_game.should be_an_instance_of Game
  end

  it 'create a board of x number of spaces' do
    test_game = Game.new(10)
    test_game.board.length.should eq 10
  end

  describe "check_cell" do
    it 'check the surrounding cells, and determine if alive or dead in the next generation' do
      test_game = Game.new(100)
      test_game.check_cell(5).should eq false

      test_game.board[5].set_state(true)
      test_game.board[6].set_state(true)
      test_game.board[4].set_state(true)
      test_game.check_cell(5).should eq true
    end
  end

  describe "next_gen" do
    it 'creates a new board based on how the previous board is set up. Returns new board' do
      test_game = Game.new(100)
      test_game.set_board([5,6,7])
      testing_only_board = test_game.board
      testing_only_board[6].set_state(true)
      testing_only_board[16].set_state(true)
      testing_only_board[5].set_state(false)
      testing_only_board[7].set_state(false)
      test_game.next_gen.should eq testing_only_board
    end
  end
end

describe 'Cell' do
  it 'Creates a cell with attribute "state" set to true for alive, false for dead' do
    Cell.new().state.should eq false
  end

  describe 'set_state' do
    it 'should be able to change state of cell' do
      test_cell = Cell.new()
      test_cell.set_state(true)
      test_cell.state.should eq true
    end
  end
end
