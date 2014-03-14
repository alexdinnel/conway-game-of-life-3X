require 'rspec'
require 'conway'

describe Game do
  it "initializes the game with new board" do
    test_game = Game.new(3)
    test_game.should be_an_instance_of Game
  end

  it "creates the board" do
    test_game = Game.new(3)
    test_game.board.should eq ([1, 2, 3, 4, 5, 6, 7, 8 ,9])
  end

  describe ".create" do
    it "creates the grid" do
      test_game = Game.create(3)
     test_game.board.should eq ([1, 2, 3, 4, 5, 6, 7, 8 ,9])
    end
  end
end


