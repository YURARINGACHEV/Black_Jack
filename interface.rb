class Interface

  def initialize
  end
  
  def interface_start_game
    puts "нажмите enter если хотите играть"
    puts "Нажмите 0, если хотите выйти с игры"
    input = gets.chomp
    input == '0'? exit : start_game
  end

  def start_game(game, bank_user, bank_diler)
    options(game, bank_user, bank_diler)
  end

  def options(game, bank_user, bank_diler)
    loop do
      puts "Раздача карт"
      game.hand_card
      puts "Ваши карты #{game.show_user_card}"
      bank_user.banks_user = bank_user.banks_user - 10
      bank_diler.banks_diler = bank_diler.banks_diler - 10
      puts
      puts 'Введите 1, если хотите пропустить ход'
      puts 'Введите 2, если хотите добавить карту'
      puts 'Введите 3, если хотите открыть карты'
      puts
      game.actions(gets.chomp)
      enter_masseg(game) if game.max_card
      break if game.end_card
    end
  end

  def enter_masseg(game)
    game.open_cards
  end

  def move_diler
    puts "Дилер сделал свой ход"
    puts
  end

  def show_points(player, val)
    puts "Сумма очков #{player.name} равна #{val}"
  end
  
  def show_card_user(hand)
    puts "Ваши карты #{hand.cards_user}"
  end

  def show_card_diler(hand)
    puts "Карты дилера #{hand.cards_diler}"
  end
  
  def draw_intarface(diler, user, bank_diler, bank_user)
    puts 'Ничья'
    puts "Счет в банке #{diler.name} равен #{bank_diler.banks_user }"
    puts "Счет в банке #{user.name} равен #{bank_user.banks_diler}"
  end

  def win_diler_interface(diler, user, bank_diler, bank_user)
    puts "Эту раздачу выиграл #{diler.name}"
    puts "Счет в банке #{diler.name} равен #{bank_diler.banks_diler}"
    puts "Счет в банке #{user.name} равен #{bank_user.banks_user}"
  end

  def win_user_interface(diler, user, bank_diler, bank_user)
    puts "Эту раздачу выиграл #{user.name} "
    puts "Счет в банке #{diler.name} равен #{bank_diler.banks_diler}"
    puts "Счет в банке #{user.name} равен #{bank_user.banks_user}"
  end

end














