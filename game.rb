class Game
  attr_accessor :pot_bet

  def initialize
    @pot_bet = 0
  end

  def win_pot_bet(player)
    player.bank_player = player.bank_player + @pot_bet
  end

  def diler_win(player)
    player.bank_player + @pot_bet
  end

  def hand_out_cards(player, card)
    card.stir_the_deck
    val = 2.times { player.to_take_cards(card) }
  end

  def options
    puts 'Введите 1, если хотите пропустить ход'
    puts 'Введите 2, если хотите добавить карту'
    puts 'Введите 3, если хотите открыть карты'
    gets.chomp
  end

  def option_one(user, diler, card)
    puts 'Дилер сделал свой ход'
    user.skip(diler, card)
    puts
    main_option(options, user, diler, card)
  end

  def option_two(user, diler, card)
    user.add_card(diler, card)
    puts "Добавлена новая карта #{user.cards_player[-1]}"
  end

  def option_three(user, diler)
    user.sum_of_points
    diler.sum_of_points
    # puts "Карты #{user.name} #{user.cards_player}"
    # puts "Карты #{diler.name} #{diler.cards_player}"
  end

  def main_option(val, user, diler, card)
    option = { '1' => -> { option_one(user, diler, card) },
               '2' => -> { option_two(user, diler, card) },
               '3' => -> { option_three(user, diler) } }
    option[val].call
  end

  def begin_game(user)
    puts
    puts "Приветствую #{user.name}. Предлогаю сыграть в Black Jack с компьютером(diler)"
    puts 'У вас и у дилера в банке по 100 долларов'
    puts 'Ставка с игрока равна 10 долларов'
    puts
    puts 'Если хотите сыграть нажмите enter'
    puts 'Если хотите выйти нажмите 0'
    exit if gets.chomp == '0'
  end

  def empty_deck(card)
    if card.cards.length < 6
      puts 'Колода закончилась '
      new_game(card)
    end
  end

  def game_over(player, card)
    if player.bank_player == 0
      puts "#{player.name} проиграл"
      new_game(card)
    end
  end

  def new_game(card)
    puts 'Если хотите начать заново, нажмите enter'
    puts 'Если хотите закончить игру нажмите 0'
    gets.chomp == '0' ? exit : card.deck_of_card
  end
end
