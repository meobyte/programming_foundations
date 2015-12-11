SUITS = ["\u2663", "\u2666", "\u2665", "\u2660"]
RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

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

  aces_count.times { total -= 10 if total > 21 }
  total
end

deck = init_deck
player_hand = deck.pop(2)
dealer_hand = deck.pop(2)

puts "Player has #{player_hand} for a total of #{hand_total(player_hand)}"
puts "Dealer has #{dealer_hand} for a total of #{hand_total(dealer_hand)}"
