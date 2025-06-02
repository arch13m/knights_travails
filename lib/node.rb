class Node
  def initialize(value)
    @value = value
    @possible_moves = compute_possible_moves
    @dist = nil
    @par = nil
  end

  attr_accessor :value, :possible_moves, :dist, :par

  def compute_possible_moves
    valid_moves = []

    knight_offsets = [
      [1, 2], [2, 1], [2, -1], [1, -2],
      [-1, -2], [-2, -1], [-2, 1], [-1, 2]
    ]
    
    knight_offsets.each do |x, y|
      new_x = @value[0] + x
      new_y = @value[1] + y
      if new_x.between?(0,7) && new_y.between?(0,7)
        valid_moves.push [new_x, new_y]
      end
    end
    valid_moves
  end
end