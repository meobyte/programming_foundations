INITIAL_MARK = ' '
PLAYER_MARK = 'X'
AI_MARK = 'O'
WINS = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
        [1, 4, 7], [2, 5, 8], [3, 6, 9],
        [1, 5, 9], [3, 5, 7]]

def prompt(message)
  puts "=> #{message}"
end

def display_board(board)
  system 'clear'
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
  square = empty_squares(board).sample
  board[square] = AI_MARK
end

def keep_score(winner, scores)
  scores.each do |player, score|
    if player == winner
      scores[player] = score + 1
    end
  end

  scores
end

scores = { 'Player' => 0, 'Computer' => 0 }

loop do
  board = initialize_board

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    scores = keep_score(detect_winner(board), scores)
    puts scores
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt "Play again? (y/n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Goodbye."
