class Player
  attr_reader :cards, :sum, :bank, :name

  def initialize(name) 
    @name = name
    @bank = 100
    @cards = {}
    @sum = 0
  end

  def place_bet
    @bank -= 10
  end

  def get_cards(cards, number)
    @cards.merge!(cards.deck.to_a.sample(number).to_h)
  end

  def check_sum
    @cards.each_value { |value| @sum += value }
  end

  def show_cards
  end

  def get_money
    @bank += 10
  end
end
