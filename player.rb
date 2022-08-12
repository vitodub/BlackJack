class Player
  attr_reader :cards

  def initialize(name) 
    @name = name
	  @bank = 100
	  @cards = {}
  end

  def place_bet
	  @bank -= 10
  end

  def get_cards(cards, number)
    @cards.merge!(cards.deck.to_a.sample(number).to_h)
  end

  def check_sum
  end

  def show_cards
  end

  def get_money
  	@bank += 10
  end
end
