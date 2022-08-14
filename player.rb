class Interface
  def call
    puts 'Введите ваше имя'
    @player_name = gets.chomp
    @player = Player.new(@player_name)
    @dealer = Dealer.new
    @card_deck = CardDeck.new    
    
    loop do
      run_interface

      puts ''

      if bank_is_empty? 
        puts "Закончились деньги для игры. Игра окончена"
        break
      else
        next
      end
      
      puts "#{@player.name}, хотите ли вы сыграть еще раз?"
      play_again = gets.chomp.downcase
      break if play_again == 'нет'
      
    end
  end

  def run_interface
    @player.get_cards(@card_deck, 2)
    @dealer.get_cards(@card_deck, 2)

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

    player_choice_1 = gets.to_i

    case player_choice_1
      when 1
        dealers_move

        if @player.cards.size < 3
          puts "#{@player.name}, хотите взять еще одну карту?"
          puts ''
          puts '1. Да'
          puts '2. Нет'

          player_choice_2 = gets.to_i

          case player_choice_2
          when 1
            @player.get_cards(@card_deck, 1)
          end
          show_cards 
        else
          show_cards
        end

      when 2
        @player.get_cards(@card_deck, 1)
        dealers_move
        show_cards

      when 3
        show_cards
    end
    @player.cards = {}
    @dealer.cards = {}              
  end

  def show_stats(player)
    puts ''
    player.check_sum
    puts "#{player.name}, ваши карты #{player.cards.keys.join(', ')} . Сумма ваших очков #{player.sum}"
  end

  def show_cards
    show_stats(@player)
    @dealer.check_sum
    puts "Карты дилера #{@dealer.cards.keys.join(', ')} . Сумма очков дилера #{@dealer.sum}"
    puts ''
        
    if @player.sum > @dealer.sum || @dealer.sum > 21
      @player.get_money
      puts "Победил #{@player.name}. В вашем банке #{@player.bank}"
      
    elsif @player.sum < @dealer.sum || @player.sum > 21
      @dealer.get_money
      puts "Победил дилер. В вашем банке #{@player.bank}"      
    elsif @player.sum == @dealer.sum || (@player.sum > 21 && @dealer.sum > 21)
      @player.draw
      @dealer.draw
      puts "Ничья. В вашем банке #{@player.bank}"
    end
  end

  def dealers_move
    puts 'Ходит дилер...'
    puts ''
    sleep 3

    @dealer.check_sum
    if @dealer.sum < 17 
      @dealer.get_cards(@card_deck, 1)
      puts "Дилер взял карту"
    else
      puts "Дилер не взял карту"
    end
  end

  def bank_is_empty?
    @player.bank <= 0 || @dealer.bank <= 0
  end

end
