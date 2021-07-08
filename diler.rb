class Diler < Player

	def add_skip_diler(card)
		return if self.points >= 17
		self.to_take_cards(card) if self.cards_player.length == 2
	end
end