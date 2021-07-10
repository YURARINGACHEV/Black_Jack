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
    Card::VALUE.each do |desk|
      Card::SUIT.each do |suit|
        card = Card.new(desk, suit)
        cards << card
      end
    end
  end
end
