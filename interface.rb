class Interface
  def call
    loop do
      run_interface
      puts 'Хотите ли вы сыграть еще раз?'
      play_again = gets.chomp.downcase
      break if play_again == 'нет'
    end
  end

  def run_interface
    puts 'Введите ваше имя'

  	player = Player.new(gets.chomp)
  	dealer = Dealer.new
    card_deck = CardDeck.new

    player.get_cards(card_deck, 2)
    dealer.get_cards(card_deck, 2)

    player.place_bet
    dealer.place_bet

    player.check_sum

    puts "#{player.name}, ваши карты #{player.cards.keys.join(', ')} . Сумма ваших очков #{player.sum}." 
    puts "Карты дилера **, ** . Сумма очков дилера **."

  end

end
