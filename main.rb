require_relative 'lib/board'
require_relative 'lib/node'

def knight_moves(start, dest)
  board = Board.new()
  board.knight_moves(start, dest)
end