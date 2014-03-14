class Conway

  attr_reader :grid, :grid_size

  @@grid = []

  def initialize(grid_size)
    @grid_size = grid_size
  end

  def Conway.create(grid_size)
    new_game = Conway.new(grid_size)
    for i in 0...grid_size
      for x in 0...grid_size
        @@grid << ((grid_size * i) + x) + 1
      end
    end
    new_game
  end

  def Conway.grid
    @@grid
  end

  def Conway.clear
    @@grid = []
  end

  def reset_board(live_cells)
    live_cells.each do |cell|
      @@grid.map! {|n| n == cell ? 'O' : n }
    end
    @@grid.map! {|n| n != 'O' ? 'X' : n}
    @@grid
  end

  def live_check(cell_to_check)
    cell_to_check
  end





end
