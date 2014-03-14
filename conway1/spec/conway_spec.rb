require 'rspec'
require 'conway'

describe Conway do

  before do
    Conway.clear
  end

  it 'will make an instance of Conway' do
    new_game = Conway.new(10)
    new_game.should be_an_instance_of Conway
  end

  describe '.create' do
    it 'will an instance of conway and build the board' do
      new_game = Conway.create(3)
      Conway.grid.length.should eq 9
    end

    it 'will an instance of conway and build the board' do
      new_game = Conway.create(3)
      Conway.grid.should eq [1,2,3,4,5,6,7,8,9]
    end
  end

  describe '#reset_board' do
    it 'will replace the grid numbers with all X\'s as dead cells' do
      new_game = Conway.create(3)
      new_game.reset_board([]).should eq ['X','X','X','X','X','X','X','X','X']
    end

    it 'will talk an array of numbers and change those to live cells' do
      new_game = Conway.create(3)
      new_game.reset_board([1,3,6]).should eq ['O','X','O','X','X','O','X','X','X']
    end
  end

  describe '#live_check' do
    it 'counts the number of the surrounding live cells' do
    new_game = Conway.create(3)
    new_game.reset_board([5,3,6])
    new_game.live_check(5).should eq 2
end
