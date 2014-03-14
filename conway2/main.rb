require "./lib/conway.rb"

def start_game
  puts "Enter board size"
  size = gets.chomp.to_i
  new_game = Game.new(size)

  print_board(new_game)

  puts "Enter numbers you like to bring them to live!!!!\n"
  live_cells = gets.chomp.split(",")
  live_cells = live_cells.map{|x| x.to_i}
  new_game.set_board(live_cells)

  print_board(new_game)
  new_game
end

def next_gen(new_game)
  new_game.next_gen
  print_board(new_game)
end

def print_board(new_game)
  new_game.board.each_with_index do |cell, index|
    if cell.state == true
      print "X"
    else
      print " "
    end

    if index % 10 == 0
      print "\n"
    end
  end
end

new_game = start_game
next_gen(new_game)
next_gen(new_game)
next_gen(new_game)

