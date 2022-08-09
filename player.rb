class Player
  def initialize(name) 
    @name = name
    @bank = 100
    @cards = []
  end

  def place_bet
    @bank -= 10
  end

  def get_cards
  end

  def add_card
    @cards << 'card'
  end

  def check_sum
  end

  def show_cards
  end

  def get_money
    @bank += 10
  end
end
