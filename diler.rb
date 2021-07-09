class Diler < Player

  def add_skip_diler(hand)
    return if points >= 17
    hand.take_cards_diler if hand.cards_diler.length == 2
  end

end
