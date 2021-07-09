class DeckOfCards
  
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def deck_of_card
    deck_of_card!
  end

  def stir_the_deck
    @cards = cards.shuffle.reverse
  end

  protected

  def deck_of_card!
    loop do
     card = Card.new
     i = "#{card.value}#{card.suit}" 
     @cards << i unless @cards.include? i
     break if @cards.length == 52
    end
    @cards
  end
end
