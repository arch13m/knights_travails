require_relative 'node'

class Board
  def initialize
    @board = Array.new(8) { Array.new(8) }
    build_board
  end

  attr_accessor :board

  def build_board
    # Makes a board of nodes (dist and par default to nil)
    coords = [0,1,2,3,4,5,6,7]
    coords.each do |x|
      coords.each do |y|
        @board[x][y] = Node.new(value=[x, y])
      end
    end
  end

  def bfs(source)
    # adds dist and par info to nodes based on source square
    q = []
    source.dist = 0
    q.push source
    visited = Set.new()
    while q.length > 0 
      node = q.shift
      node.possible_moves.each do |neighbour|
        neighbour_node = @board[neighbour[0]][neighbour[1]]
        if neighbour_node.dist == nil
          neighbour_node.par = node
          neighbour_node.dist = node.dist + 1
          q.push neighbour_node
          visited << neighbour_node unless visited.include? neighbour_node
        end
      end
    end
    visited
  end
  
  def find_square(x, y)
    #finds node for given co-ordinate pair
    @board[x][y]
  end

  def find_path_to(node, arr=[])
    unless node.par.nil?
      arr.unshift node.value
      return find_path_to(node.par, arr)
    end
    arr.unshift node.value
    arr
  end
  
  def knight_moves(start, dest)
    start_node = find_square(start[0], start[1])
    dest_node = find_square(dest[0], dest[1])
    bfs(start_node)
    puts("You made it in #{dest_node.dist} moves! Here's your path:")
    find_path_to(dest_node).each {|i| p i}
  end
end