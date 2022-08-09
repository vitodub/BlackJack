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
  	Player.new(gets.chomp)
  	Player.new('Дилер')
  end

end
