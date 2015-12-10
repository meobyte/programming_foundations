SUITS = ["\u2663", "\u2666", "\u2665", "\u2660"]
RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

def init_deck
  SUITS.product(RANKS).shuffle
end
