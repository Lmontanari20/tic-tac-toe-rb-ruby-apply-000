def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, character)
  if valid_move?(board,index)
    board[index] == character
  end
end

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
  index >= 0 && index <= 8 && !position_taken(board,index)
end

def turn(board, character)
  puts "Welcome! Take your turn by inputting 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board,index, character)
    display_board
    return
  else 
    turn(board,character)
  end
end
