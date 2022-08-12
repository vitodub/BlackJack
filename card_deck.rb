class CardDeck
 
  VALUES = { '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
            '10': 10, 'Валет': 10, 'Дама': 10, 'Король': 10, 'Туз': 11 }
  SUITS = ["\u2660", "\u2665" , "\u2663", "\u2666"]

  attr_reader :deck

  def initialize
    @deck = {}
    get_deck
  end

  def get_deck
    SUITS.each do |suit|
      cards = VALUES.transform_keys { |value| (value.to_s + suit).to_sym }
      @deck.merge!(cards)
    end
  end

end
