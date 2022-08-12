class Player
  attr_reader :cards, :sum, :bank, :name

  def initialize(name) 
    @name = name
	  @bank = 100
	  @cards = {}
    @sum
  end

  def place_bet
	  @bank -= 10
  end

  def get_cards(cards, number)
    @cards.merge!(cards.deck.to_a.sample(number).to_h)
  end

  def check_sum
    s = 0
    @cards.each_value { |value| s += value }
    @sum = s
  end

  def get_money
  	@bank += 10
  end
end
