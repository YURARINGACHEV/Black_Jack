class Interface
  def interface_start_game
    puts 'нажмите enter если хотите играть'
    puts 'Нажмите 0, если хотите выйти с игры'
    input = gets.chomp
    input == '0' ? exit : start_game
  end

  def make_a_bet(bank)
    puts
    puts 'Ставки в 10 долларов сделаны'
    puts "Ваш чет в банке #{bank.bank_user -= 10}"
    puts "Счет в банке дилера #{bank.bank_diler -= 10}"
  end

  def options(game, bank)
    loop do
      make_a_bet(bank)
      game.hand_card
      puts
      puts "Ваши карты #{game.show_user_card}"
      puts
      puts 'Введите 1, если хотите пропустить ход'
      puts 'Введите 2, если хотите добавить карту'
      puts 'Введите 3, если хотите открыть карты'
      puts
      game.actions(gets.chomp)
      bank_user_masseg(game, bank.bank_user) if game.bank_user_zero
      bank_diler_masseg(game, bank.bank_diler) if game.bank_diler_zero
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

  def bank_user_masseg(game, bank)
    puts "Вы проиграли. Счет в банке равен #{bank.bank_user} "
    game.open_cards
  end

  def bank_diler_masseg(game, bank)
    puts "Diler проиграл. Счет в банке равен #{bank.bank_diler} "
    game.open_cards
  end

  def move_diler
    puts
    puts 'Дилер сделал свой ход'
    puts
  end

  def show_points(player, val)
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

  def draw_intarface(diler, user, bank, hand_user, hand_diler)
    puts 'Ничья'
    puts "Сумма очков #{user.name} #{hand_user.points}"
    puts "Сумма очков #{diler.name} #{hand_diler.points}"
    puts "Счет в банке #{diler.name} равен #{bank.bank_diler}"
    puts "Счет в банке #{user.name} равен #{bank.bank_user}"
  end

  def win_diler_interface(diler, user, bank, hand_user, hand_diler)
    puts "Эту раздачу выиграл #{diler.name}"
    puts "Сумма очков #{user.name} #{hand_user.points}"
    puts "Сумма очков #{diler.name} #{hand_diler.points}"
    puts "Счет в банке #{diler.name} равен #{bank.bank_diler}"
    puts "Счет в банке #{user.name} равен #{bank.bank_user}"
  end

  def win_user_interface(diler, user, bank, hand_user, hand_diler)
    puts "Эту раздачу выиграл #{user.name} "
    puts "Сумма очков #{user.name} #{hand_user.points}"
    puts "Сумма очков #{diler.name} #{hand_diler.points}"
    puts "Счет в банке #{diler.name} равен #{bank.bank_diler}"
    puts "Счет в банке #{user.name} равен #{bank.bank_user}"
  end
end
