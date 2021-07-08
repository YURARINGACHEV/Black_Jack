class DeckOfCards
  attr_reader :value_cards, :cards, :suits
  attr_accessor :cards

  def initialize
    @cards = []
    @value_cards = %w[2 3 4 5 6 7 8 9 10 J Q K A]
    @suits = ['+', '^', '<>', '<3']
  end

  def deck_of_card
    deck_of_card!
  end

  def stir_the_deck
    @cards = cards.shuffle.reverse
  end

  protected

  def deck_of_card!
    @cards = [] if @cards.length > 0
    value_cards.each do |desk|
      suits.each do |suit|
        @cards << "#{desk}#{suit}"
      end
    end
    @cards
  end
end
