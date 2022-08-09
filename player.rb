class Player
  def initialize(name) 
    @name = name
    @bank = 100
    @cards = []
  end

  def place_bet
    @bank -= 10
  end

  def add_card
    @cards << 'card'
  end
end
