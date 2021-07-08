class User < Player

  def add_card(player, card)
    self.to_take_cards(card) if self.cards_player.length == 2 
    player.add_skip_diler(card)
  end
  
  def skip(player, card)
    player.add_skip_diler(card)
  end

end