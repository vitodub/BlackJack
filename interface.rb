class Interface
  def call
    loop do
      run_interface
      break if answer == 'Нет'
    end
  end

  def run_interface
  	Player.New(puts 'Введите ваше имя')
  	Player.New('Дилер')
  end

end
