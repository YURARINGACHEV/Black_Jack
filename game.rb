class Game
  def initialize(hand_user, hand_diler, user,
                 diler, deck, interface, bank)

    @bank = bank
    @hand_user = hand_user
    @hand_diler = hand_diler
    @diler = diler
    @user = user
    @deck = deck
    @interface = interface
  end

  def user_add_cards
    @user.add_card(@hand_user, @hand_diler, @diler, @deck)
    @interface.show_card_user(@hand_user)
  end

  def user_skip
    @interface.move_diler
    @user.skip(@hand_diler, @diler, @deck)
  end

  def open_cards
    count_points_user
    count_points_diler
    @interface.show_card_user(@hand_user)
    @interface.show_card_diler(@hand_diler)
    game_result
  end

  def actions(val)
    option = { '1' => -> { user_skip },
               '2' => -> { user_add_cards },
               '3' => -> { open_cards } }
    @interface.start_game if @hand_user.cards_player == 3 && @hand_diler.cards_player == 3
    option[val].call
  end

  def hand_card
    @hand_user.cards_player = []
    @hand_diler.cards_player = []
    @hand_user.take_cards_player(@deck)
    @hand_user.take_cards_player(@deck)
    @hand_diler.take_cards_player(@deck)
    @hand_diler.take_cards_player(@deck)
  end

  def show_user_card
    @hand_user.cards_player
  end

  def bank_diler_zero
    @bank.bank_diler.zero?
  end

  def bank_user_zero
    @bank.bank_user.zero?
  end

  def end_card
    @deck.cards.length < 6
  end

  def count_points_user
    @hand_user.sum_of_points_player
    @interface.show_points(@user, @hand_user.points)
  end

  def count_points_diler
    @hand_diler.sum_of_points_player
    @interface.show_points(@diler, @hand_diler.points)
  end

  def deal_cards_diler
    @hand.take_cards_diler
    @interface.show_card_user(@hand_user)
    @interface.show_card_diler(hand_diler)
  end

  def deal_cards_user
    @hand.take_cards_user
    @interface.show_card_user(@hand_user)
    @interface.show_card_diler(hand_diler)
  end

  def game_result
    if @hand_user.points == @hand_diler.points
      @bank.bank_diler += 10
      @bank.bank_user += 10
      @interface.draw_intarface(@diler, @user, @bank, @hand_user, @hand_diler)
    elsif @hand_user.points > 21
      @bank.bank_diler += 20
      @interface.win_diler_interface(@diler, @user, @bank, @hand_user, @hand_diler)
    elsif @hand_user.points <= 21
      if @hand_diler.points > @hand_user.points && @hand_diler.points <= 21
        @bank.bank_diler += 20
        @interface.win_diler_interface(@diler, @user, @bank, @hand_user, @hand_diler)
      elsif @hand_diler.points < @hand_user.points
        @bank.bank_user += 20
        @interface.win_user_interface(@diler, @user, @bank, @hand_user, @hand_diler)
      elsif @hand_diler.points > 21
        @bank.bank_user += 20
        @interface.win_user_interface(@diler, @user, @bank, @hand_user, @hand_diler)
      end
    end
  end
end
