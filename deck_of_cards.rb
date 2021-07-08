class DeckOfCards

  attr_reader :value_cards, :cards, :suits

	def initialize
		
		@cards = []
		@value_cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
		@suits = ['+', '^', '<>', '<3']
	end

	def deck_of_card
		deck_of_card!
	end

	def stir_the_deck
    self.cards.shuffle.reverse
  end 	

	protected
  
	def deck_of_card!
    value_cards.each do |desk|
      suits.each do |suit|
        @cards << "#{desk}#{suit}"
      end
    end
    @cards
  end
end




# Вариант составления колоды
# cards = []
# decks = ‘2345678TJQKA’
# suits = ‘tkcp’ #trefl, karo, czerwień, pik
# decks.each_byte do |deck|
# suits.each_byte do |suit|
# cards << deck.chr + suit.chr
# end
# end
# Перемешать колоду
# cards.shuffle.reverse.shuffle.reverse.shuffle