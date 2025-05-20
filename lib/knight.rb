require_relative 'node'

class Knight
  def initialize(start, destination)
    @start = start
    @destination = destination
    @queue = []
    @visited_squares = Set.new()
  end

  attr_accessor :square, :queue

  def possible_moves
    square = Node.new(@square[0], @square[1])
    square.possible_moves.each {|i| @queue.unshift Node.new(i[0], i[1])}
  end

  def next_move_win?
    next_move = @queue[0]
    next_move.x == @destination[0] && next_move.y == @destination[1]
  end

  def next_move
    @visited_squares << @square
    if next_move_win?
      @visited_squares << @destination
      puts "Travelled from #{@square} to #{@destination} in #{@visited_squares.length} moves."
      print @visited_squares
      return
    else
      
      possible_moves
    end
  end



  def build_board_with_dists_and_parents
    @possible.moves
  end
end