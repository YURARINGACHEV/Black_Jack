class Diler < Player
  def add_skip_diler(hand_diler, deck)
    return if hand_diler.points >= 17

    hand_diler.take_cards_player(deck) if hand_diler.cards_player.length == 2
  end
end
