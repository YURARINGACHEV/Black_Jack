class User < Player
  def add_card(hand_user, hand_diler, diler, deck)
    hand_user.take_cards_player(deck) if hand_user.cards_player.length == 2
    diler.add_skip_diler(hand_diler, deck)
  end

  def skip(hand_diler, diler, deck)
    diler.add_skip_diler(hand_diler, deck)
  end
end
