class Game

  attr_reader :board


  def initialize(grid)
    @grid = grid
    @board = (1..grid*grid).to_a
  end

  # def Game.create(grid)
  #   new_game = Game.new(grid)
  #   board = (1..grid).to_a
  # end

  # def board
  #   @@board
  # end
end


