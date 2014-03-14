class Game
  attr_reader :board, :happy

  def initialize(size)
    @board = []
    @happy = []
    size.times do
      @board << Cell.new()
    end
  end

  def happy
    @happy << "poop"
  end

  def poop
    @happy *= 2
  end

  def set_board(indexes_of_live_cells)
    indexes_of_live_cells.each do |index|
      @board[index].set_state(true)
    end
  end

  def next_gen
    temp_board = @board
    @board.each_with_index do |cell, index|
      if check_cell(index) == true
        temp_board[index].set_state(true)

      else
         temp_board[index].set_state(false)
      end
    end

    @board = temp_board
  end

  def check_cell(index)
    current_cell_state = @board[index].state

    counter = 0

    if index < 89
      [1, -1, 9, -9, 10, -10, 11, -11].each do |i|
        if @board[index + i].state
          counter += 1
        end
      end
    elsif index >= 89 && index < 99
      [1, -1, -9, -11, -10].each do |i|
        if @board[index + i].state
          counter += 1
        end
      end
    else
      [-1, -9, -10, -11].each do |i|
        if @board[index + i].state
          counter += 1
        end
      end
    end

    if current_cell_state
      case counter
      when 0 || 1 || 4
        false
      when 2 || 3
        true
      end
    else
      counter == 3
    end
  end
end

class Cell
  attr_reader :state

  def initialize
    @state = false
  end

  def set_state(state)
    @state = state
  end
end
