class User < Player

  def add_card(hand, diler)
    hand.take_cards_user if hand.cards_user.length == 2
    diler.add_skip_diler(hand)
  end

  def skip(hand, diler)
    diler.add_skip_diler(hand)
  end
end
