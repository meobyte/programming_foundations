SUITS = ["\u2663", "\u2666", "\u2665", "\u2660"]
RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
DEALER_MIN = 17
HAND_MAX = 21

def init_deck
  SUITS.product(RANKS).shuffle
end

def hand_total(cards)
  total = 0
  card_values = cards.map { |card| card[1] }
  aces_count = card_values.count("A")

  card_values.each do |card|
    if card.to_i > 0
      total += card.to_i
    elsif card == "A"
      total += 11
    else
      total += 10
    end
  end

  aces_count.times { total -= 10 if total > HAND_MAX }
  total
end

def busted?(hand)
  hand_total(hand) > HAND_MAX
end

def calculate_result(player_hand, dealer_hand)
  player_total = hand_total(player_hand)
  dealer_total = hand_total(dealer_hand)

  if player_total > HAND_MAX
    :player_busted
  elsif dealer_total > HAND_MAX
    :dealer_busted
  elsif dealer_total > player_total
    :dealer
  elsif player_total > dealer_total
    :player
  else
    :tie
  end
end

def keep_score(player_hand, dealer_hand, scores)
  result = calculate_result(player_hand, dealer_hand)

  case result
  when :player_busted || :dealer
    scores['Dealer'] += 1
  when :dealer_busted || :player
    scores['You'] += 1
  end
  scores
end

def show_result(player_hand, dealer_hand)
  result = calculate_result(player_hand, dealer_hand)

  case result
  when :player_busted
    puts "You busted. Dealer wins."
  when :dealer_busted
    puts "Dealer busted. You win."
  when :dealer
    puts "Dealer wins."
  when :player
    puts "You win."
  when :tie
    puts "It's a tie."
  end
end

def show_hands(player_hand, dealer_hand, final = false)
  system 'clear'
  if final
    puts "Dealer has #{dealer_hand} for a total of #{hand_total(dealer_hand)}"
  else
    puts "Dealer has #{dealer_hand[0]}"
  end
  puts "You have #{player_hand} for a total of #{hand_total(player_hand)}"
end

def player_turn(deck, player_hand, dealer_hand)
  loop do
    puts "Would you like to (h)it or (s)tay"
    action = gets.chomp.downcase

    if action == 'h'
      player_hand << deck.pop
      show_hands(player_hand, dealer_hand)
    elsif action == 's'
      puts "You chose to stay."
    else
      puts "Must enter h or s."
    end
    break if action == 's' || busted?(player_hand)
  end
end

def dealer_turn(deck, dealer_hand)
  loop do
    break if busted?(dealer_hand) || hand_total(dealer_hand) >= DEALER_MIN
    dealer_hand << deck.pop
  end
end

def replay(scores)
  answer = 'y'
  if scores.value?(5)
    scores.each { |player, score| puts "#{scores[player]} won!" if score == 5 }
    scores = { 'You' => 0, 'Dealer' => 0 }
    puts "Do you want to play again? Y/n"
    answer = gets.chomp
  else
    puts "You won #{scores['You']} and Dealer won #{scores['Dealer']}"
    puts "press enter to continue to next hand"
    gets.chomp
  end
  answer.downcase.start_with?('y')
end

scores = { 'You' => 0, 'Dealer' => 0 }
loop do
  system 'clear'
  deck = init_deck
  player_hand = deck.pop(2)
  dealer_hand = deck.pop(2)

  show_hands(player_hand, dealer_hand)
  player_turn(deck, player_hand, dealer_hand)
  dealer_turn(deck, dealer_hand) unless busted?(player_hand)
  show_hands(player_hand, dealer_hand, true)
  show_result(player_hand, dealer_hand)
  
  scores = keep_score(player_hand, dealer_hand, scores)

  break unless replay(scores)
end

puts "Thanks for playing Twenty-One! Goodbye."
