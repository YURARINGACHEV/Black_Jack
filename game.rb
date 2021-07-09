class Game

  def initialize( hand, user, diler,
                  deck_of_cards, interface,
                  bank_diler, bank_user )
    
    @bank_diler = bank_diler
    @bank_user = bank_user
    @hand = hand
    @diler = diler
    @user = user
    @deck_of_cards = deck_of_cards
    @interface = interface 
    @pot_bet = 20
  end
  
  def actions(val)
    option = { '1' => -> { user_skip },
               '2' => -> { user_add_cards },
               '3' => -> { open_cards } }
    @interface.start_game if @hand.cards_user == 3 && @hand.cards_diler == 3
    option[val].call
  end

  def hand_card
    @hand.cards_user = []
    @hand.cards_diler = []
    @hand.take_cards_diler
    @hand.take_cards_user
    @hand.take_cards_diler
    @hand.take_cards_user
  end

  def show_user_card
    @hand.cards_user
  end

  def max_card
    @hand.cards_user.length == 3
  end

  def end_card
    @deck_of_cards.cards.length < 6
  end

  def count_points_user
    @hand.sum_of_points_user
    @interface.show_points(@user, @user.points)
  end

  def count_points_diler
    @hand.sum_of_points_diler
    @interface.show_points(@diler, @diler.points)
  end

  def deal_cards_diler
    @hand.take_cards_diler
    @interface.show_card_user(@hand)
  end

  def deal_cards_user
    @hand.take_cards_user
    @interface.show_card_user(@hand)
  end

  def user_add_cards
    @user.add_card(@hand, @diler)
    @interface.show_card_user(@hand)
  end

  def user_skip
    @interface.move_diler
    @user.skip(@hand, @diler)
    @interface.show_card_user(@hand)
  end

  def open_cards
    count_points_user
    count_points_diler
    @interface.show_card_user(@hand)
    @interface.show_card_diler(@hand)
    game_result
  end

  def game_result
    if @user.points == @diler.points
      @bank_diler.bank_after_draw
      @interface.draw_intarface(@diler, @user, @bank_diler,@bank_user)
    elsif @user.points > 21
      @bank_diler.bank_after_win_diler
      @interface.win_diler_interface(@diler, @user, @bank_diler, @bank_user)
    elsif @user.points <= 21
      if @diler.points > @user.points && @diler.points <= 21
        @bank_diler.bank_after_win_diler
        @interface.win_diler_interface(@diler, @user, @bank_diler, @bank_user)
      elsif @diler.points < @user.points
        @bank_user.bank_after_win_user
        @interface.win_user_interface(@diler, @user, @bank_diler, @bank_user)
      elsif @diler.points < 21
        @bank_user.bank_after_win_user
        @interface.win_user_interface(@diler, @user, @bank_diler, @bank_user)
      end
    end
  end

end
  # def win_pot_bet(player)
  #   player.bank_player = player.bank_player + @pot_bet
  # end

  # def diler_win(player)
  #   player.bank_player + @pot_bet
  # end

  # def hand_out_cards(player, card)
  #   card.stir_the_deck
  #   val = 2.times { player.to_take_cards(card) }
  # end

  # def options
  #   puts 'Введите 1, если хотите пропустить ход'
  #   puts 'Введите 2, если хотите добавить карту'
  #   puts 'Введите 3, если хотите открыть карты'
  #   gets.chomp
  # end

  # def option_one(user, diler, card)
  #   puts 'Дилер сделал свой ход'
  #   user.skip(diler, card)
  #   puts
  #   main_option(options, user, diler, card)
  # end

  # def option_two(user, diler, card)
  #   user.add_card(diler, card)
  #   puts "Добавлена новая карта #{user.cards_player[-1]}"
  # end

  # def option_three(user, diler)
  #   user.sum_of_points
  #   diler.sum_of_points
  #   # puts "Карты #{user.name} #{user.cards_player}"
  #   # puts "Карты #{diler.name} #{diler.cards_player}"
  # end

  # def main_option(val, user, diler, card)
  #   option = { '1' => -> { option_one(user, diler, card) },
  #              '2' => -> { option_two(user, diler, card) },
  #              '3' => -> { option_three(user, diler) } }
  #   option[val].call
  # end

  # def begin_game(user)
  #   puts
  #   puts "Приветствую #{user.name}. Предлогаю сыграть в Black Jack с компьютером(diler)"
  #   puts 'У вас и у дилера в банке по 100 долларов'
  #   puts 'Ставка с игрока равна 10 долларов'
  #   puts
  #   puts 'Если хотите сыграть нажмите enter'
  #   puts 'Если хотите выйти нажмите 0'
  #   exit if gets.chomp == '0'
  # end

  # def empty_deck(card)
  #   if card.cards.length < 6
  #     puts 'Колода закончилась '
  #     new_game(card)
  #   end
  # end

  # def game_over(player, card)
  #   if player.bank_player == 0
  #     puts "#{player.name} проиграл"
  #     new_game(card)
  #   end
  # end

  # def new_game(card)
  #   puts 'Если хотите начать заново, нажмите enter'
  #   puts 'Если хотите закончить игру нажмите 0'
  #   gets.chomp == '0' ? exit : card.deck_of_card
  # end

