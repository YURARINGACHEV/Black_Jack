class Hand
  
  attr_accessor :cards_user, :cards_diler

  def initialize(user, diler, deck_of_card)
  	@deck_of_card = deck_of_card
  	@user = user
  	@diler = diler
  	@value_cards = { '2' => 2, '3' => 3, '4' => 4,
                     '5' => 5, '6' => 6, '7' => 7,
                     '8' => 8, '9' => 9, '10' => 10,
                     'J' => 10, 'Q' => 10, 'K' => 10,
                     'A' => 11 }
  	@cards_diler = []
  	@cards_user = []
  end

  def change_value_diler
    @value_cards['A'] = @diler.points <= 11 ? 11 : 1
  end

  def change_value_user
    @value_cards['A'] = @user.points <= 11 ? 11 : 1
  end

  def take_cards_diler
    @cards_diler << @deck_of_card.cards.delete(@deck_of_card.cards.sample)
  end 

  # def take_card
  #   @deck_of_card.cards.delete(@deck_of_card.cards.sample)
  # end 

  def take_cards_user
    @cards_user << @deck_of_card.cards.delete(@deck_of_card.cards.sample)
  end

  def sum_of_points_user
    @user.points = 0
    @cards_user.each do |val|
      @user.points += @value_cards[val[0]]
      change_value_user
    end
    @user.points
  end

  def sum_of_points_diler
    @diler.points = 0
    @cards_diler.each do |val|
      @diler.points += @value_cards[val[0]]
      change_value_diler
    end
    @diler.points
  end
  

end





















