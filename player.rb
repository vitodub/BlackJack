class Player
  attr_reader :sum, :bank, :name
  attr_accessor :cards

  MAX_POINT = 21
  ACE_VALUE = 11
  MIN_MAX_ACE_DIFF = 10

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
    if s > MAX_POINT && @cards.has_value?(ACE_VALUE)
      (s - MIN_MAX_ACE_DIFF) < MAX_POINT ? @sum = s - MIN_MAX_ACE_DIFF : @sum = s
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
