class CardDeck
  
  @@values = { '2': 2, '3': 3, '4': 4, '5': 5,
               '6': 6, '7': 7, '8': 8, '9': 9,
              '10': 10, 'Валет': 10, 'Дама': 10,
          'Король': 10, 'Туз': 11 }
  @@suits = ["\u2660", "\u2665" , "\u2663", "\u2666"]


  def self.get_random(n)
    @@values.to_a.sample(n).to_h.transform_keys { |key| (key.to_s + @@suits.sample).to_sym }
  end

end
