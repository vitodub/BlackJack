class Player
  attr_reader :sum, :bank, :name
  attr_accessor :cards

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
    s = @cards.values.sum
    if s > 21 && @cards.has_value?(11)
      (s - 10) < 21 ? @sum = s - 10 : @sum = s
    else
      @sum = s
    end
  end

  def get_money
  	@bank += 20
  end

  def draw
    @bank += 10
  end

end
