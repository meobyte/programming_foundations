INITIAL_MARK = ' '
PLAYER_MARK = 'X'
AI_MARK = 'O'
WINS = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
        [1, 4, 7], [2, 5, 8], [3, 6, 9],
        [1, 5, 9], [3, 5, 7]]

def prompt(message)
  puts "=> #{message}"
end

def display_board(board, scores)
  system 'clear'
  keep_score(detect_winner(board), scores)
  puts <<-eos
  You're #{PLAYER_MARK}; Computer is #{AI_MARK}

       |     |
    #{board[1]}  |  #{board[2]}  |  #{board[3]}
       |     |
  -----+-----+-----
       |     |
    #{board[4]}  |  #{board[5]}  |  #{board[6]}
       |     |
  -----+-----+-----
       |     |
    #{board[7]}  |  #{board[8]}  |  #{board[9]}
       |     |

  eos
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARK }
  new_board
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARK }
end

def joinor(array, delimiter = ', ', word = 'or')
  if array.size > 1
    last = array.pop.to_s
    string = array.join(delimiter)
    string += ' ' + word + ' ' + last
  end
  string
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  if WINS.any? { |line| line.all? { |square| board[square] == PLAYER_MARK } }
    return 'Player'
  elsif WINS.any? { |line| line.all? { |square| board[square] == AI_MARK } }
    return 'Computer'
  end
  nil
end

def best_move(board)
  [AI_MARK, PLAYER_MARK].each do |piece|
    WINS.each do |line|
      pieces_in_line = line.count { |square| board[square] == piece }
      empty = line.select { |square| board[square] == ' ' }
      return empty.first if pieces_in_line == 2 && empty.length == 1
    end
  end
  nil
end

def player_places_piece!(board)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(board))}):"
    square = gets.chomp.to_i
    if empty_squares(board).include?(square)
      break
    else
      prompt "Sorry, that's not a valid choice."
    end
  end
  board[square] = PLAYER_MARK
end

def computer_places_piece!(board)
  square = best_move(board) || empty_squares(board).sample
  board[square] = AI_MARK
end

def keep_score(winner, scores)
  scores.each { |player, score| scores[player] = score + 1 if player == winner }
  puts "Player won #{scores['Player']} and Computer won #{scores['Computer']}"
end

scores = { 'Player' => 0, 'Computer' => 0 }

loop do
  board = initialize_board

  loop do
    display_board(board, scores)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board, scores)

  if someone_won?(board)
    prompt "#{detect_winner(board)} wins this round!"
  else
    prompt "It's a tie!"
  end

  answer = "y"
  if scores.value?(5)
    scores.each { |player, score| puts "#{scores[player]} wins!" if score == 5 }
    scores = { 'Player' => 0, 'Computer' => 0 }
    prompt "Play again? (y/n)"
    answer = gets.chomp
  end

  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Goodbye."
