require_relative 'node'

class Board
  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  attr_accessor :board

  def build_board
    coords = [0,1,2,3,4,5,6,7]
    coords.each do |x|
      coords.each do |y|
        @board[x][y] = Node.new(value=[x, y])
      end
    end
  end

  def bfs(x, y)
    source = find_square(x, y)
    q = []
    source.dist = 0
    q.push source

    while q.length > 0
      node = q.shift
      node.possible_moves.each do |neighbour|
        if neighbour.dist == nil
          neighbour.par = node
          neighbour.dist = node.dist + 1
          q.push neighbour
        end
      end
    end
  end
  
  def find_square(x, y)
    @board[x][y]
  end
end