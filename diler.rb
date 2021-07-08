class Diler < Player
  def add_skip_diler(card)
    return if points >= 17

    to_take_cards(card) if cards_player.length == 2
  end
end
