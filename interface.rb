class Interface
  def interface_start_game
    puts 'нажмите enter если хотите играть'
    puts 'Нажмите 0, если хотите выйти с игры'
    input = gets.chomp
    input == '0' ? exit : start_game
  end

  def start_game(game, bank_user, bank_diler)
    bank_user.auto_bet_player
    bank_diler.auto_bet_player
    puts
    puts 'Ставки в 10 долларов сделаны'
    puts
    options(game, bank_user, bank_diler)
  end

  def options(game, bank_user, bank_diler)
    loop do
      game.hand_card
      puts
      puts "Ваши карты #{game.show_user_card}"
      puts
      puts 'Введите 1, если хотите пропустить ход'
      puts 'Введите 2, если хотите добавить карту'
      puts 'Введите 3, если хотите открыть карты'
      puts
      game.actions(gets.chomp)
      bank_user_masseg(game, bank_user) if game.bank_user_zero
      bank_diler_masseg(game, bank_diler) if game.bank_diler_zero
      if game.end_card
        enter_masseg(game)
        break
      end
    end
  end

  def enter_masseg(game)
    puts 'Закончилась калода. Игра окончена'
    game.open_cards
  end

  def bank_user_masseg(game, bank_user)
    puts "Вы проиграли. Счет в банке равен #{bank_user.banks_player} "
    game.open_cards
  end

  def bank_diler_masseg(game, bank_diler)
    puts "Diler проиграл. Счет в банке равен #{bank_diler.banks_player} "
    game.open_cards
  end

  def move_diler
    puts
    puts 'Дилер сделал свой ход'
    puts
  end

  def show_points(player, val)
    puts
    puts "Сумма очков #{player.name} равна #{val}"
    puts
  end

  def show_card_user(hand_user)
    puts
    puts "Ваши карты #{hand_user.cards_player}"
    puts
  end

  def show_card_diler(hand_diler)
    puts
    puts "Ваши карты #{hand_diler.cards_player}"
    puts
  end

  def draw_intarface(diler, user, bank_diler, bank_user, hand_user, hand_diler)
    puts 'Ничья'
    puts
    puts "Сумма очков #{user.name} #{hand_user.points}"
    puts "Сумма очков #{diler.name} #{hand_diler.points}"
    puts
    puts "Счет в банке #{diler.name} равен #{bank_diler.banks_player}"
    puts "Счет в банке #{user.name} равен #{bank_user.banks_player}"
  end

  def win_diler_interface(diler, user, bank_diler, bank_user, hand_user, hand_diler)
    puts "Эту раздачу выиграл #{diler.name}"
    puts
    puts "Сумма очков #{user.name} #{hand_user.points}"
    puts "Сумма очков #{diler.name} #{hand_diler.points}"
    puts
    puts "Счет в банке #{diler.name} равен #{bank_diler.banks_player}"
    puts "Счет в банке #{user.name} равен #{bank_user.banks_player}"
  end

  def win_user_interface(diler, user, bank_diler, bank_user, hand_user, hand_diler)
    puts "Эту раздачу выиграл #{user.name} "
    puts
    puts "Сумма очков #{user.name} #{hand_user.points}"
    puts "Сумма очков #{diler.name} #{hand_diler.points}"
    puts
    puts "Счет в банке #{diler.name} равен #{bank_diler.banks_player}"
    puts "Счет в банке #{user.name} равен #{bank_user.banks_player}"
  end
end
