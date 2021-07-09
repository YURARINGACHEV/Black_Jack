class BlackJack

  def initialize
 	  bank_user = BankUser.new
    bank_diler = BankDiler.new
    card = DeckOfCards.new
    card.deck_of_card
    puts "Введите имя"
    user = User.new(gets.chomp, card)
    diler = Diler.new('diler', card)
    hand = Hand.new(diler, user, card)
    interface = Interface.new
    game = Game.new(hand, user, diler, card, interface, bank_diler, bank_user)
    interface.start_game(game, bank_user, bank_diler)
  end
  
end