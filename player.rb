class Player
  attr_reader :points, :name, :value_cards
  attr_accessor :bank_player, :auto_player_bet, :cards_player

  def initialize(name)
    @name = name
    @value_cards = { '2' => 2, '3' => 3, '4' => 4,
                     '5' => 5, '6' => 6, '7' => 7,
                     '8' => 8, '9' => 9, '10' => 10,
                     'J' => 10, 'Q' => 10, 'K' => 10,
                     'A' => 11 }
    @bank_player = 100
    @cards_player = []
    @points = 0
    @auto_player_bet = 10
  end

  def change_value
    @value_cards['A'] = @points <= 11 ? 11 : 1
  end

  def to_take_cards(desk_of_card)
    @cards_player << desk_of_card.cards.delete(desk_of_card.cards.sample)
  end

  def sum_of_points
    @points = 0
    @cards_player.each do |val|
      @points += @value_cards[val[0]]
      change_value
    end
    @points
  end

  def bank_after_bet
    self.bank_player = bank_player - 10
  end

  def bank_after_win(game)
    self.bank_player = bank_player + game.pot_bet
  end

  # def bank_after_losing
  #   self.bank_player = self.bank_player - 10
  # end

  def bank_after_draw
    self.bank_player = bank_player + 10
  end
end
