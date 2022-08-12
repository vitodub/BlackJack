lass Interface
  def call
    loop do
      run_interface
      puts ''
      puts 'Хотите ли вы сыграть еще раз?'
      play_again = gets.chomp.downcase
      break if play_again == 'нет'
    end
  end

  def run_interface
    puts 'Введите ваше имя'

  	@player = Player.new(gets.chomp)
  	@dealer = Dealer.new
    card_deck = CardDeck.new

    @player.get_cards(card_deck, 2)
    @dealer.get_cards(card_deck, 2)

    @player.place_bet
    @dealer.place_bet

    show_stats(@player)
    puts "Карты дилера **, ** . Сумма очков дилера **"

    puts ''
    puts 'Что делаем дальше?'
    puts '1. Пропустить'
    puts '2. Добавить карту'
    puts '3. Открыть карты'
    puts ''

    @player_choice_1 = gets.to_i

    case @player_choice_1
      when 1
        puts 'Ход переходит к дилеру'
      when 2
        @player.get_cards(card_deck, 1)
        show_stats(@player)
      when 3
        show_cards
    end                  
  end

  def show_stats(player)
    @player.check_sum
    puts "#{@player.name}, ваши карты #{@player.cards.keys.join(', ')} . Сумма ваших очков #{@player.sum}"
  end

  def show_cards
    show_stats(@player)
    @dealer.check_sum
    puts "Карты дилера #{@dealer.cards.keys.join(', ')} . Сумма очков дилера #{@dealer.sum}"
        
    if @player.sum > @dealer.sum
      puts "Победил #{@player.name}"
      @player.get_money
    elsif @player.sum < @dealer.sum
      puts "Победил дилер"
      @dealer.get_money
    else
      puts "Ничья"
      @player.get_money
      @dealer.get_money
    end
  end

end
