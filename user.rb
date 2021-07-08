class User < Player
  def add_card(diler, card)
    to_take_cards(card) if cards_player.length == 2
    diler.add_skip_diler(card)
  end

  def skip(player, card)
    player.add_skip_diler(card)
  end
end
