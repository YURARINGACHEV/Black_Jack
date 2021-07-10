class Hand
  attr_accessor :cards_player, :points

  VALUE_CARDS = { '2' => 2, '3' => 3, '4' => 4,
                  '5' => 5, '6' => 6, '7' => 7,
                  '8' => 8, '9' => 9, '10' => 10,
                  'J' => 10, 'Q' => 10, 'K' => 10,
                  'A' => 11 }

  def initialize
    @cards_player = []
    @points = 0
  end

  def change_value_player
    VALUE_CARDS['A'] = @points <= 11 ? 11 : 1
  end

  def take_cards_player(deck)
    @cards_player << deck.cards.delete(deck.cards.sample)
  end

  def sum_of_points_player
    @points = 0
    @cards_player.each do |val|
      @points += VALUE_CARDS[val.value]
      change_value_player
    end
    @points
  end
end
